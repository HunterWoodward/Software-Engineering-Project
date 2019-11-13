# == Schema Information
#
# Table name: comics
#
#  id           :integer          not null, primary key
#  title        :string
#  issue_number :integer
#  description  :text
#  comic_type   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comic < ApplicationRecord
    has_many :pages, dependent: :destroy
    validates :title, :description, :comic_type, presence:true
    validates :title, uniqueness: true
    validate :has_cover_image
    has_one_attached :cover

    def has_cover_image
        if cover.attached? && !cover.content_type.in?(%w(image/jpeg image/png))
            errors.add(:cover, 'Is must be a JPEG or PNG file')
        elsif cover.attached? == false
            errors.add(:cover, 'Is Required')
        end
    end

    def count_pages
        pages.count
    end
end
