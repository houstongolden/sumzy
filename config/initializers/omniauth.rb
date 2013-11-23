Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "PxdaBMSxpchdQzLkSetRfQ", "HkFvVmxx4ZKjBF2GDB6VMsoBu4xdXRo8UKpmx767hrM"
  provider :facebook, "381290208669517", "af0240dbeebf9ea2ec72d647e821dbab"
end

