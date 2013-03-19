class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.lunch :references
      t.string :emailaddress
      t.string :name
      t.integer :pluses

      t.timestamps
    end
  end
end
