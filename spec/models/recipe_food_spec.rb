require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject do
    RecipeFood.new(
      recipe_id: 1,
      food_id: 1,
      quantity: 1
    )
  end

  before { subject.save }

  it 'recipe_id should be present' do
    subject.recipe_id = nil
    expect(subject).to_not be_valid
  end

  it 'food_id should be present' do
    subject.food_id = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'quantity must be a integer greater or equal than zero' do
    subject.quantity = -1
    expect(subject).to_not be_valid
  end
end
