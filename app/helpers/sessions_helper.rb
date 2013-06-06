module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user # invokes current_user=(user) 
  end
  def signed_in?
    !current_user.nil?
  end
  def current_user=(user) # acts like a setter method ( that's why "=" is there )
    @current_user=user
  end
  def current_user
    @current_user ||= User.find_by_remember_token( cookies[:remember_token] )
  end
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
