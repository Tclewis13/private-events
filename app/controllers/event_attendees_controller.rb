class EventAttendeesController < ApplicationController
  def attend
    puts params[:event_id]
    puts current_user.id
    @event_attendee = EventAttendee.new(event_id: params[:event_id], attendee_id: current_user.id)
    if @event_attendee.save
      redirect_to Event.find(params[:event_id]), notice: "You have signed up to attend this event."
    else
      puts @event_attendee.errors.full_messages
    end
  end
end
