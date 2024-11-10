class EventAttendeesController < ApplicationController
  def attend
    @event_attendee = EventAttendee.new(event_id: params[:event_id], attendee_id: current_user.id)
    @duplicate = EventAttendee.find_by(event_id: @event_attendee.event_id, attendee_id: @event_attendee.attendee_id)
    if !@duplicate.nil?
      redirect_to Event.find(params[:event_id]), alert: "You are already signed up to attend this event."
    elsif @event_attendee.save
      redirect_to Event.find(params[:event_id]), notice: "You have signed up to attend this event."
    else
      redirect_to Event.find(params[:event_id]), alert: "Sign-up failed because #{@event_attendee.errors.full_messages}"
    end
  end
end
