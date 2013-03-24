class RemoveAttendeeIdFromLunches < ActiveRecord::Migration
  def change
    remove_column(:lunches, :attendee_id)
  end
end
