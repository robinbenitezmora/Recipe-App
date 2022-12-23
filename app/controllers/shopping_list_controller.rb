class ShoppingListController < ApplicationController
  def index
    @shopping_list = Recipe.includes(:user).order(created_at: :desc)
  end
end
