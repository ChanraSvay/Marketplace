class CheckoutsController < ApplicationController
    before_action :authenticate_user!

    def show
        current_user.processor = stripe
        current_user

        @checkout_session = current_user.payment_processor.checkout(
            mode: "payment"

        )
    end
end