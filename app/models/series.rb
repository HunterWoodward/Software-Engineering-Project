# == Schema Information
#
# Table name: series
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Series < ApplicationRecord
    has_many :comics, dependent: :destroy
    validates :title, :description, presence:true
    validates :title, uniqueness: true
    validate :has_cover_image
    has_one_attached :cover
    before_save :downcase_fields

    def has_cover_image
        if cover.attached? && !cover.content_type.in?(%w(image/jpeg image/png))
            errors.add(:cover, 'Is must be a JPEG or PNG file')
        elsif cover.attached? == false
            errors.add(:cover, 'Is Required')
        end
    end

    def downcase_fields
        title.downcase!
    end
    
end


