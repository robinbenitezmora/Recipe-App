require 'rails_helper'

RSpec.describe Food, type: :model do
<<<<<<< HEAD
  subject { Food.new(name: 'Potatoe', price: 15.25, measurement_unit: 'Kg', user_id: 1)}
=======
  subject { Food.new(name: 'Potatoe', price: 15.25, measurementunit: 'Kg', user_id: 1) }
>>>>>>> 96fef7b1b64344e376655c67a602444b5499781c

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
