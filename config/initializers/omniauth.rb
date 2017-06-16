# In config/initializers/omniauth.rb
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET']
    provider :coinbase, ENV["COINBASE_CLIENT_ID"], ENV["COINBASE_CLIENT_SECRET"]
    # , scope: 'wallet:user:read wallet:user:email wallet:accounts:read'
  end