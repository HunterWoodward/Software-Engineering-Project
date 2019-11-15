# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  page_number :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  comic_id    :integer
#
# Indexes
#
#  index_pages_on_comic_id  (comic_id)
#

class Page < ApplicationRecord
    belongs_to :comic
    validates :page_number, presence:true
    validate :has_image
    has_one_attached :image

    def has_image
        if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
            errors.add(:image, 'must be a JPEG or PNG file')
        elsif image.attached? == false
            errors.add(:image, 'Is Required')
        end
    end
end
