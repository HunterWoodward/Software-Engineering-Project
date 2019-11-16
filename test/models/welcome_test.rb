# == Schema Information
#
# Table name: welcomes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_welcomes_on_user_id  (user_id)
#

require 'test_helper'

class WelcomeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
