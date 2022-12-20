require 'rails_helper'

RSpec.describe "recipes/index", type: :view do
  before(:each) do
    assign(:recipes, [
      Recipe.create!(
        name: "Name",
        prepation_time: "9.99",
        cooking_time: "9.99",
        description: "MyText",
        public: false,
        user: nil
      ),
      Recipe.create!(
        name: "Name",
        prepation_time: "9.99",
        cooking_time: "9.99",
        description: "MyText",
        public: false,
        user: nil
      )
    ])
  end

  it "renders a list of recipes" do
    render
    cell = Rails::VERSION::STRING >= '6.1' ? 'div>p' : 'tr>td'
    assert_select "#{cell}", text: "Name".to_s, count: 2
    assert_select "#{cell}", text: "9.99".to_s, count: 2
    assert_select "#{cell}", text: "9.99".to_s, count: 2
    assert_select "#{cell}", text: "MyText".to_s, count: 2
    assert_select "#{cell}", text: false.to_s, count: 2
    assert_select "#{cell}", text: nil.to_s, count: 2
  end
end
