class User < ActiveRecord::Base
  
  def self.from_omniauth(auth)
    omniauth_using_facebook(auth) if auth.provider == 'facebook'
    omniauth_using_twitter(auth) if auth.provider == 'twitter' 
  end

  private

  def self.omniauth_using_facebook(auth)
    where(facebook_uid: auth.uid).first || create_from_omniauth_facebook(auth)
  end

  def self.omniauth_using_twitter(auth)
    where(twitter_uid: auth.uid).first || create_from_omniauth_twitter(auth)
  end

  def self.create_from_omniauth_facebook(auth)
    create! do |user|
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.gender = auth.extra.raw_info.gender
      user.facebook_uid = auth.uid
      user.facebook_token = auth.credentials.token
      user.facebook_expires_at = Time.at(auth.credentials.expires_at)
    end
  end

  def self.create_from_omniauth_twitter(auth)
    create! do |user|
      user.first_name = auth.info.name
      user.twitter_uid = auth.uid
      user.location = auth.info.location
      user.twitter_token = auth.credentials.token
      user.twitter_secret = auth.credentials.secret
    end
  end

end
