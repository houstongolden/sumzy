module Twitter

  def tweet(message)
    Twitter::REST::Client.new(consumer_key:'m11Uc0cRM7nyFfhEBP8w', consumer_secret: 'nhye8I2UUIp4mG1yR1kynBfZ4ztZGWNwYqxVSVpUA', oauth_token:User.first.twitter_token, oauth_token_secret:User.first.twitter_secret).update('hai')
  end
  
  private

  
end
