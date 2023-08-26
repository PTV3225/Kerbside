class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user

    if @message.save
      if @message.content.present?
        ChatroomChannel.broadcast_to(
          @chatroom,
          message: render_to_string(partial: "message", locals: { message: @message }),
          sender_id: @message.user.id
        )
        head :ok
      else
        render "chatrooms/chatroom", status: :unprocessable_entity
      end
    end
  end

  def index
    @chatroom = Chatroom.find(params[:chatroom_id])
    @messages = @chatroom.messages.order(created_at: :desc).limit(10) # Change the limit as needed
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
