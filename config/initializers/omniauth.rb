# OmniAuth.config.logger = Rails.logger

ENV = YAML.load_file('config/keys.yml')

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end