Rails.configuration.stripe = {
    :public_key => ENV['PUBLIC_KEY'],
    :secret_key => ENV['SECRET_KEY']

}
# Stripe.api_key = Rails.application.credentials[:stripe][:secret_key]
# Stripe.api_key = Rails.configuration.stripe[:secret_key]
Stripe.api_key = Rails.application.credentials.stripe_secret_key
