# == Schema Information
#
# Table name: discussions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comic_id   :integer
#  series_id  :integer
#  review_id  :integer
#
# Indexes
#
#  index_discussions_on_comic_id   (comic_id)
#  index_discussions_on_review_id  (review_id)
#  index_discussions_on_series_id  (series_id)
#

require 'test_helper'

class DiscussionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
