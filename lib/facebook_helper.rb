module FacebookHelper

  def get_basic_info
    facebook_api_object.get_object("me")
  end

  def get_friends
    facebook_api_object.get_connections("me", "friends")
  end

  def get_feed
    #to = Time.now.to_i
    #yest = 1.year.ago.to_i
    facebook_api_object.fql_query("SELECT post_id, actor_id, target_id, message, attachment FROM stream WHERE filter_key in (SELECT filter_key FROM stream_filter WHERE uid=me() AND type='newsfeed') AND is_hidden = 0")
    #facebook_api_object.fql_query("SELECT post_id, actor_id, target_id, message, likes FROM stream WHERE source_id = me() AND created_time > #{yest} AND created_time < #{to}")
 
  end

  def post(message)
    facebook_api_object.put_connections("me", "feed", :message => message)
  end

  private

  def facebook_api_object
    Koala::Facebook::API.new(self.facebook_token)  
  end
end
