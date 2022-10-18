class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Loggoed succesfuly"
      redirect_to user
    else
      flash.now[:alert] = "there was something wrng with your login details" 
      render 'new'
    end
      
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Loggoed Out succesfuly"
    redirect_to root_path
  end

end