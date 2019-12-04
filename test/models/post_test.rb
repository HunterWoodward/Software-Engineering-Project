# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  body          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  discussion_id :integer
#  user_id       :integer
#
# Indexes
#
#  index_posts_on_discussion_id  (discussion_id)
#  index_posts_on_user_id        (user_id)
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
