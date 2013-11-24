module Facebook

  def get_basic_info
    Koala::Facebook::API.new(self.facebook_token).get_object("me")
  end

  def get_friends
    Koala::Facebook::API.new(self.facebook_token).get_connections("me", "friends")
  end

end
