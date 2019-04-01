class MessageBroadcastJob < ApplicationJob
  # queue_as :default

  # ブロードキャスト処理を実装
  def perform(message)
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

  private

    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
    end
end
