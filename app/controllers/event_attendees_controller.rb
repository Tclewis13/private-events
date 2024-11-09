class EventAttendeesController < ApplicationController
  def attend
    puts params[:event_id]
    puts current_user.id
    @event_attendee = EventAttendee.new(event_id: params[:event_id], attendee_id: current_user.id)
    @event_attendee.creator = Event.find(@event_attendee.event_id).creator.id
    if @event_attendee.save
      format.html { redirect_to @event, notice: "You have signed up to attend this event." }
      format.json { render :show, status: :created, location: @event }
    else
      puts @event_attendee.errors.full_messages
    end
  end
end
