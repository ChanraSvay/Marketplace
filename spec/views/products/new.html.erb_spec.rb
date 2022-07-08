require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      title: "MyString",
      description: nil,
      price: 1,
      condition: 1,
      sold: false,
      user: nil,
      category: nil
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[title]"

      assert_select "input[name=?]", "product[description]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[condition]"

      assert_select "input[name=?]", "product[sold]"

      assert_select "input[name=?]", "product[user_id]"

      assert_select "input[name=?]", "product[category_id]"
    end
  end
end
