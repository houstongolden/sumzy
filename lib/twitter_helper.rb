module TwitterHelper

  def post_on_twitter(message)
    twitter_api_object.update(message)
  end

  def get_twitter_friends
    twitter_api_object.friends
  end
  
  def get_twitter_feed
    twitter_api_object.home_timeline(include_entities:true)  
  end
  
  private

  def twitter_api_object
    Twitter::REST::Client.new(consumer_key:sumzy_twitter_key, consumer_secret:sumzy_twitter_secret, oauth_token:twitter_token, oauth_token_secret:twitter_secret)
  end

  def sumzy_twitter_key
    'm11Uc0cRM7nyFfhEBP8w'
  end

  def sumzy_twitter_secret
    'nhye8I2UUIp4mG1yR1kynBfZ4ztZGWNwYqxVSVpUA'
  end
  
end
