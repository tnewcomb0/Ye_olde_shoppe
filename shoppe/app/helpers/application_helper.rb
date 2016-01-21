module ApplicationHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @admin = @current_user.admin if @current_user
    display_message
  end

  def current_user=(user)
    session[:user_id] = user.id
  end

  def make_price(price_in_cents)
    "$#{price_in_cents/100}"
  end

  def set_message(msg_text)
    session[:message] = msg_text
  end

  def display_message
    if session[:message]
      @message = session[:message]
      session[:message] = nil
    end
  end

end
