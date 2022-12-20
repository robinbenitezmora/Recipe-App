require 'rails_helper'

RSpec.describe "foods/index", type: :view do
  before(:each) do
    assign(:foods, [
      Food.create!(
        name: "Name",
        measurement_unit: "Measurement Unit",
        price: "9.99",
        quantity: "9.99",
        user: nil
      ),
      Food.create!(
        name: "Name",
        measurement_unit: "Measurement Unit",
        price: "9.99",
        quantity: "9.99",
        user: nil
      )
    ])
  end

  it "renders a list of foods" do
    render
    cell = Rails::VERSION::STRING >= '6.1' ? 'div>p' : 'tr>td'
    assert_select "#{cell}", text: "Name".to_s, count: 2
    assert_select "#{cell}", text: "Measurement Unit".to_s, count: 2
    assert_select "#{cell}", text: "9.99".to_s, count: 2
    assert_select "#{cell}", text: "9.99".to_s, count: 2
    assert_select "#{cell}", text: nil.to_s, count: 2
  end
end
