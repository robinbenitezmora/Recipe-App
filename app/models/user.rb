class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes
  has_many :foods
  has_many :inventories, foreign_key: :user_id, dependent: :destroy

  validates :name, presence: true
end
