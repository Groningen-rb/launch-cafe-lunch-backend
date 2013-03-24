# == Schema Information
#
# Table name: lunches
#
#  id          :integer          not null, primary key
#  attendee_id :integer
#  lunch_time  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class LunchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
