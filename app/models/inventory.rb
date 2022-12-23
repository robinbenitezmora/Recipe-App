class Inventory < ApplicationRecord
  validates :name, presence: true, length: { maximum: 150 }
  belongs_to :user, foreign_key: 'user_id'
  has_many :inventory_foods, dependent: :destroy
end
