class TreasuresController < ApplicationController
  before_action :set_post

  def new
    @treasure = @post.treasures.build
  end

  def create
    @treasure = @post.treasures.build(treasure_params)
    if @treasure.save
      redirect_to @post, notice: 'Treasure was successfully added.'
    else
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def treasure_params
    params.require(:treasure).permit(:description, :treasure_type_id, :photo)
  end
end
