class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    @message = Message.new
    @chatrooms = Chatroom.all
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:user_id)
  end
end
