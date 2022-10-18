class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in? #per poterlo usare anche nei layout, altrimenti essendo in questo faile è valido solo per i controller
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end


  def logged_in?
    !!current_user #trasforma oin boollean un valore
  end


  def require_user
    if !logged_in?
      flash[:alert] = "Devi essere loggato per fare questo azione"
      redirect_to login_path
    end
  end

end
