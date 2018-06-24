class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.json { render json: @event, status: :created }
      else
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :description, :start, :end)
  end
end