class TreasuresController < ApplicationController
  before_action :set_post
  before_action :set_treasure, only: [:edit, :update]



  # def update_status
  #   @treasure = Treasure.find(params[:id])
  #   @treasure.update(status: !@treasure.status)
  #   redirect_to dashboard_path # Redirect to the appropriate path after updating
  # end



  def mark_as_pending
    treasure = Treasure.find(params[:id])
    treasure.update(status: :pending)
    redirect_to dashboard_path, notice: "Treasure marked as pending."
  end

  def mark_as_collected
    treasure = Treasure.find(params[:id])
    treasure.update(status: :collected)
    redirect_to dashboard_path, notice: "Treasure marked as collected."
  end


  def new
    @treasure = @post.treasures.build
  end

  def create
    @treasure = @post.treasures.build(treasure_params)
    @treasure.status = true

    if @treasure.save
      redirect_to @post, notice: 'Treasure was successfully added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @treasure.update(treasure_params)
      redirect_to @post, notice: 'Treasure was successfully updated.'
    else
      render :edit
    end
  end

  def delete
    @treasure = Treasure.find(params[:id])
    @treasure.destroy

    respond_to do |format|
      format.js
    end
  end

  # def update_availability
  #   @treasure = Treasure.find(params[:id])
  #   @treasure.update(status: params[:status])

  #   respond_to do |format|
  #     format.js
  #   end
  # end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_treasure
    @treasure = @post.treasures.find(params[:id])
  end

  def treasure_params
    params.require(:treasure).permit(:description, :treasure_type_id, :photo, :status)
  end
end
