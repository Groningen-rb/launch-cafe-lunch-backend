class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :emailaddress
      t.string :name
      t.integer :pluses
      t.references :lunch
      t.timestamps
    end
  end
end
