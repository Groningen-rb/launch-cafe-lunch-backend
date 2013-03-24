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

require 'test_helper'

class AttendeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
