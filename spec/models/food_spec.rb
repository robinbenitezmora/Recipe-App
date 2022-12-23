require 'rails_helper'

RSpec.describe Food, type: :model do
  subject { Food.new(name: 'Potatoe', price: 15.25, measurement_unit: 'Kg', user_id: 1) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'price should be present' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'measurement_unit should be present' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'user_id should be a float greater or equal than zero' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'price must be a float greater or equal than zero' do
    subject.price = -1
    expect(subject).to_not be_valid
  end
end
