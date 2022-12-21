require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    Recipe.new(
      name: 'Beans',
      preparationtime: 20,
      cookingtime: 30,
      description: 'Beans Soap',
      public: true,
      user_id: 1
    )
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'cooking_time should be present' do
    subject.cookingtime = nil
    expect(subject).to_not be_valid
  end

  it 'description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'public should be present' do
    subject.public = nil
    expect(subject).to_not be_valid
  end

  it 'user_id should be present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'cooking_time must be a integer greater or equal than zero' do
    subject.cookingtime = -1
    expect(subject).to_not be_valid
  end
end
