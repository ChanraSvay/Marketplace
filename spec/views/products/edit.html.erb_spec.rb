require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      title: "MyString",
      description: nil,
      price: 1,
      condition: 1,
      sold: false,
      user: nil,
      category: nil
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

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
