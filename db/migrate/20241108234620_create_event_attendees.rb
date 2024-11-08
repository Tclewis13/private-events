class CreateEventAttendees < ActiveRecord::Migration[7.2]
  def change
    create_table :event_attendees do |t|
      t.integer :event_id
      t.integer :attendee_id

      t.timestamps
    end
  end
end
