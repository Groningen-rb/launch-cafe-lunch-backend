class CreateLunches < ActiveRecord::Migration
  def change
    create_table :lunches do |t|
      t.integer :attendee_id
      t.datetime :lunch_time
      t.timestamps
    end
  end
end
