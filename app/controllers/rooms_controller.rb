class RoomsController < ApplicationController
  before_action :show, only: [:sum_counter, :sub_counter ]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
  end

  def create
    @room = Room.new(room_params)

    @room.save
    redirect_to @room
  end


  def sum_counter
    @room.increment(:counter_value) unless @room.counter_value == @room.max_counter
    ActionCable.server.broadcast "live_counter_channel",
     { room_id: @room.id, counter_value: @room.counter_value } if @room.save!
  end

  def sub_counter

    @room.decrement(:counter_value) unless @room.counter_value == 0 && !@room.accepts_negative
    ActionCable.server.broadcast "live_counter_channel",
    { room_id: @room.id, counter_value: @room.counter_value } if @room.save!
  end

  def destroy
  end

  private

  def room_params
    params.require(:room).permit(:name, :password, :max_counter, :counter_value)
  end

end
