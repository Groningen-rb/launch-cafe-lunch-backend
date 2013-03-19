class Attendee < ActiveRecord::Base
  attr_accessible :emailaddress, :name, :pluses, :references
end
