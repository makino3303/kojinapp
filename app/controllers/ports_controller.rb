class PortsController < ApplicationController

def index
  @messages = Message.new

  render layout: false
end


def create
  @messages = Message.new(message_params)
  if @messages.save
    redirect_to ports_path()
  else
    # saveできなければトップ画面へ
    render ''
  end
end


  private

  def message_params
    params.require(:message).permit(
      :name,
      :email,
      :phone_number,
      :text
    )
  end
end

