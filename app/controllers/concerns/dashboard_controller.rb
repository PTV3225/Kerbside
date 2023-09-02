class DashboardController < ApplicationController
  def show






    @user = current_user
    @posts = @user.posts
    @favorite_posts = current_user.favorited_posts
    @collected_treasures =  current_user.treasures.collected

    @markers = @favorite_posts.geocoded.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { post: post })
      }
    end

  end








end
