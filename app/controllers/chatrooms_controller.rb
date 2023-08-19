class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    # @post = Post.find(params[:post_id])
    @message = Message.new
  end
end
