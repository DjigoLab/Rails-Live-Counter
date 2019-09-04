class LiveCounterChannel < ApplicationCable::Channel
  def subscribed
    if params[:room_id].present?
      stream_from("live_counter_channel-#{(params[:room_id])}")
    else
      stream_from("live_counter_channel")
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
