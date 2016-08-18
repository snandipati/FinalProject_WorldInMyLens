OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '226121200931595', '10b9c4f32d053031b25145a9df8fd45e', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end