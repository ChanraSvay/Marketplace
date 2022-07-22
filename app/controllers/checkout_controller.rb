class CheckoutController < ApplicationController

    def create  
      @product = Product.find(params[:id])
      @session = Stripe::Checkout::Session.create({
  payment_method_types: ['card'],
  line_items: [{
    amount: @product.price,
    currency: "aud",
    quantity: 1,
    name: @product.id
  }],
  mode: 'payment',
  success_url: root_url,
  cancel_url: root_url,
})
    respond_to do |format|
        format.json
    end
   end
end
