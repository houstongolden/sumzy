module TwitterHelper

  def tweet(message)
    twitter_api_object(twitter_token, twitter_secret).update(message)
  end
  
  
  

  def twitter_api_object(user_token, user_secret)
    Twitter::REST::Client.new(consumer_key:sumzy_twitter_key, consumer_secret:sumzy_twitter_secret, oauth_token:user_token, oauth_token_secret:user_secret)
  end

  def sumzy_twitter_key
    'm11Uc0cRM7nyFfhEBP8w'
  end

  def sumzy_twitter_secret
    'nhye8I2UUIp4mG1yR1kynBfZ4ztZGWNwYqxVSVpUA'
  end
  
end
