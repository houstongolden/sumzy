Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "m11Uc0cRM7nyFfhEBP8w", "nhye8I2UUIp4mG1yR1kynBfZ4ztZGWNwYqxVSVpUA"
  provider :facebook, "1435406776682568", "348c6f652dfa71fabdd714d583c1f413", {:scope => 'read_stream,publish_stream,offline_access,email'}
end

