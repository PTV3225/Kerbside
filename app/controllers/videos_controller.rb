class VideosController < ApplicationController
  def index
    if params[:query].present?
      @videos = Video.global_search(params[:query])
    else
      @videos = Video.all
    end
  end


end
