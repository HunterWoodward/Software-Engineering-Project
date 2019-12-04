# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comic_id   :integer
#  series_id  :integer
#  user_id    :integer
#
# Indexes
#
#  index_reviews_on_comic_id   (comic_id)
#  index_reviews_on_series_id  (series_id)
#  index_reviews_on_user_id    (user_id)
#

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
