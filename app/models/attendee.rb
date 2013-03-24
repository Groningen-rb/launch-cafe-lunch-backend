# == Schema Information
#
# Table name: attendees
#
#  id           :integer          not null, primary key
#  emailaddress :string(255)
#  name         :string(255)
#  pluses       :integer
#  lunch_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Attendee < ActiveRecord::Base
  attr_accessible :emailaddress,
                  :name,
                  :pluses,
                  :lunch_id

  belongs_to :lunch
end
