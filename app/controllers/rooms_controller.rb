class RoomsController < ApplicationController
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


  def operate
    @room = Room.find(params[:id])
    if params[:operation] == 'sum'
      @room.increment!(:counter_value)
    elsif params[:operation] == 'sub'
      @room.decrement!(:counter_value)
    else
      redirect_to @room
    end
    if @room.save!
      ActionCable.server.broadcast "live_counter_channel", {
          # counter: RoomsController.render(
          #     partial: 'counter',
          #     locals: {room: @room},
          #     roomid: @room.id
          # )
          room_id: @room.id,
          counter_value: @room.counter_value
      }
    end
  end

  def destroy
  end

  private

  def room_params
    params.require(:room).permit(:name, :password, :max_counter, :counter_value)
  end

end
