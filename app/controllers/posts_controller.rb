class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.photos.attach(params[:post][:photos])
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
    render :new
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
