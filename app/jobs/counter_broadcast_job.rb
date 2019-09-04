class CounterBroadcastJob < ApplicationJob
  queue_as :default

  def perform(rooms)
    # Do something later
  end

  def build_room_id(id)
    "ChatRoom-#{id}"
  end
end
