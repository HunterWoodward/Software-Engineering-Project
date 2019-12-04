# == Schema Information
#
# Table name: series
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_series_on_user_id  (user_id)
#

class Series < ApplicationRecord
    belongs_to :author,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :series
    has_many :comics, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_one :discussion, dependent: :destroy
    validates :title, :description, presence:true
    validates :title, uniqueness: true
    validate :has_cover_image
    has_one_attached :cover
    after_create :downcase_fields
    after_save :create_discussions


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
    
    def create_discussions
        Discussion.create!(series_id: self.id)
    end
end


