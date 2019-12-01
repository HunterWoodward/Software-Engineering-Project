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

class Discussion < ApplicationRecord
    has_many :posts, dependent: :destroy
    belongs_to :comic ,optional: true
    belongs_to :series,optional: true
    belongs_to :review,optional: true
end
