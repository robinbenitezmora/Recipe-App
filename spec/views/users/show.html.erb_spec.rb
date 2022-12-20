require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!( name: "Example User" ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Example User/)
  end
end
