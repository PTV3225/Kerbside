class PostsController < ApplicationController

  def index

    if params[:query].present?
      sql_subquery = <<~SQL
        posts.location ILIKE :query
        OR posts.description ILIKE :query
        OR posts.council_pickup_date::TEXT LIKE :query
      SQL

      @posts = Post.where(sql_subquery, query: "%#{params[:query]}%")
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

    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
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
