require 'rails_helper'

RSpec.describe 'recipe_foods/show', type: :view do
  before(:each) do
    assign(:recipe_food, RecipeFood.create!(
                           recipe: nil,
                           food: nil,
                           quantity: 1.5
                         ))
  end

  it 'renders attributes in <p>' do
    render
    cell = Rails::VERSION::STRING >= '5.1' ? 'div>p' : 'tr>td'
    expect(rendered).to match(/#{cell}/)
    expect(rendered).to match(/#{cell}/)
    expect(rendered).to match(/#{cell}/)
  end
end
