require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        title: "Title",
        description: nil,
        price: 2,
        condition: 3,
        sold: false,
        user: nil,
        category: nil
      ),
      Product.create!(
        title: "Title",
        description: nil,
        price: 2,
        condition: 3,
        sold: false,
        user: nil,
        category: nil
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
