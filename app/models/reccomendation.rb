# == Schema Information
#
# Table name: reccomendations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  comic_id   :integer
#
# Indexes
#
#  index_reccomendations_on_comic_id  (comic_id)
#  index_reccomendations_on_user_id   (user_id)
#

class Reccomendation < ApplicationRecord
    belongs_to :user   
    belongs_to :comic
    validates :user_id, uniqueness: true
end
