class PostsController < ApplicationController



  def index

    if params[:query].present?
      sql_subquery = <<~SQL
        posts.location ILIKE :query
        OR posts.description ILIKE :query
        OR posts.council_pickup_date::TEXT LIKE :query
      SQL

      @posts = Post.where(sql_subquery, query: "%#{params[:query]}%")
      @markers = @posts.geocoded.map do |post|
        {
          lat: post.latitude,
          lng: post.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: {post: post})
        }
      end

    else

    @posts = Post.all

    @markers = @posts.geocoded.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {post: post})
      }
    end
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @chatroom = Chatroom.new
    @chatroom.post_id = @post.id
    @chatroom.name = "chatroom for #{@post.description}"
    @post.chatroom = @chatroom
    @chatroom.save

    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def favorite
    @post = Post.find(params[:id])
    current_user.favorite(@post)

    if request.referer.include?(request.path_parameters[:id])

      redirect_to post_path, notice: 'Post favorited!'
    else

      redirect_to posts_path, notice: 'Post favorited!'
    end

  end

 def unfavorite
  @post = Post.find(params[:id])
  current_user.unfavorite(@post)

  if request.referer.include?('dashboard') # check if current page is dashboard
    redirect_to dashboard_path, notice: 'Post unfavorited!'
  elsif request.referer.include?(request.path_parameters[:id]) # check if current page is post/:id
    redirect_to post_path, notice: 'Post unfavorited!'
  else # assume current page is post index
    redirect_to posts_path, notice: 'Post unfavorited!'
  end
end

  def favorites
    @favorite_posts = current_user.favorited_posts
  end

  def show
    @post = Post.find(params[:id])
    @chatroom = @post.chatroom
    @message = Message.new
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Hard rubbish listing updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])

    unless @post.user == current_user
      flash[:alert] = "You are not allowed to delete this post. For more information contact admin@admin.nz"
      redirect_to @post and return
    end

    if @post.destroy
      redirect_to posts_path, notice: "Hard rubbish listing deleted successfully."
    else
      flash[:alert] = "Failed to delete hard rubbish listing."
      redirect_to @post
    end
  end

  private

    def post_params
      params.require(:post).permit(:location, :description, :council_pickup_date, photos: [])
    end
end
