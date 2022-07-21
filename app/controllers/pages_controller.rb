class PagesController < ApplicationController
  def home
    @products = Product.listing
  end

  def success
  end
end
