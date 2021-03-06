# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default("0"), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  bio                    :text
#  role                   :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #   :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_many :posts,
    class_name: 'Post',
    foreign_key: 'user_id',
    inverse_of: :creator,
    dependent: :destroy
  has_many :reviews,
    class_name: 'Review',
    foreign_key: 'user_id',
    inverse_of: :critic,
    dependent: :destroy
  has_many :comics,
    class_name: 'Comic',
    foreign_key: 'user_id',
    inverse_of: :author,
    dependent: :destroy
  has_many :series,
    class_name: 'Series',
    foreign_key: 'user_id',
    inverse_of: :author,
    dependent: :destroy
  has_many :reccomendations   
  has_many :comics, through: :reccomendations
  before_save :set_default_role

  def set_default_role
    self.role ||= 'Fan'
  end
      
end
