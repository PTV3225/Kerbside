class DashboardController < ApplicationController
  def show

    @user = current_user
    @posts = @user.posts



  end
end
