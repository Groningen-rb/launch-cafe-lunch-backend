# == Schema Information
#
# Table name: lunches
#
#  id          :integer          not null, primary key
#  lunch_time  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Lunch < ActiveRecord::Base
  attr_accessible :lunch_time

  has_many :attendees
end
