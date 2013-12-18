module SessionsHelper
  def log_in(user)
    user.persistence_token = SecureRandom.urlsafe_base64  
    user.save
    session[:omniauth] = nil
    cookies.permanent[:persistence_token] = user.persistence_token
    self.current_user = user
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.where(:persistence_token => cookies[:persistence_token]).first
  end

  def current_user?(user)
    user == current_user
  end

  def log_out
    self.current_user = nil
    cookies.delete(:persistence_token)
  end
end

