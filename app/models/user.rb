class User < ActiveRecord::Base
  
  has_one :profile

  after_create :create_profile

  include FacebookHelper
  include TwitterHelper
  
  def create_profile
    user = User.last
    profile = Profile.create(contact_email: user.email, user_id: user.id)
  end 

  def from_omniauth(auth)
    omniauth_using_facebook(auth) if auth.provider == 'facebook'
    omniauth_using_twitter(auth) if auth.provider == 'twitter' 
  end

  private

  def omniauth_using_facebook(auth)
    User.where(facebook_uid: auth.uid).first || create_from_omniauth_facebook(auth)
  end

  def omniauth_using_twitter(auth)
    User.where(twitter_uid: auth.uid).first || create_from_omniauth_twitter(auth)
  end

  def create_from_omniauth_facebook(auth)
    self.first_name = auth.info.first_name
    self.last_name = auth.info.last_name
    self.email = auth.info.email
    self.gender = auth.extra.raw_info.gender
    self.location = auth.info.location
    self.remote_image_url = auth.info.image
    self.facebook_uid = auth.uid
    self.facebook_token = auth.credentials.token
    self.facebook_expires_at = Time.at(auth.credentials.expires_at)
  end

  def create_from_omniauth_twitter(auth)
    self.first_name = auth.info.name
    self.remote_image_url = auth.info.image
    self.twitter_uid = auth.uid
    self.location = auth.info.location
    self.twitter_token = auth.credentials.token
    self.twitter_secret = auth.credentials.secret
  end

end
