class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  validates :name, presence: true
  validates :description, presence: true
  validates :preparationtime, numericality: { greater_than_or_equal_to: 0 }
  validates :cookingtime, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, presence: true
end
