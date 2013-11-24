Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "dhMrrXMekdrL3wKEbn4w", "ayc19GH5oyDkX94NQ4gnBvTdUGK9tkn2MF58nzc4cuU"
  provider :facebook, "1435406776682568", "348c6f652dfa71fabdd714d583c1f413", {:scope => 'read_stream,publish_stream,offline_access,email'}
end

