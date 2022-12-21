require 'rails_helper'

RSpec.describe 'recipe_foods/index', type: :view do
  before(:each) do
    assign(:recipe_foods, [
             RecipeFood.create!(
               recipe: nil,
               food: nil,
               quantity: 1.5
             ),
             RecipeFood.create!(
               recipe: nil,
               food: nil,
               quantity: 1.5
             )
           ])
  end

  it 'renders a list of recipe_foods' do
    render
    cell = Rails::VERSION::STRING >= '5.1' ? 'div>p' : 'tr>td'
    assert_select cell.to_s, text: nil.to_s, count: 2
    assert_select cell.to_s, text: nil.to_s, count: 2
    assert_select cell.to_s, text: 1.5.to_s, count: 2
  end
end
