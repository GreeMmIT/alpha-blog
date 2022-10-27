class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit,:update]
before_action :require_user, only: [:edit, :update]
before_action :require_same_user , only: [:edit,:update]
  def show 
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new 
  end

  def edit
  end

  def index 
    @users =  User.paginate(page: params[:page], per_page: 5)
  end

  def create
    @user = User.new (user_params)
    if @user.save
      session[:user_id]= @user.id #con questa riga inizializzo la varibile di sessione e calcolo come loggato il nuovo utente
      flash[:notice] = "Welcome to the alpha blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end

  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Account aggiornato correttamente!"
      redirect_to @user
    else
      render 'edit'
    end

  end

private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:alert]="Deve essere lo stesso utente per modificare"
      redirect_to @user
    end
  end

end