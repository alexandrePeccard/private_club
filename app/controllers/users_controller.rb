class UsersController < ApplicationController
	before_action :require_login, only: [:index]
	before_action :require_no_login, only: [:new, :create, :edit, :update]
  before_action :check_is_user_profile, only: [:edit, :update]
  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to '/login'
    end
  end

  def require_no_login
  	if logged_in?
      flash[:error] = "You can't create new account if you already have one."
      redirect_to '/'
    end
  end

  def check_is_user_profile
    if Integer(current_user.id) != Integer(params[:id])
      flash[:notice] = "This content is private."
      redirect_to '/'
    end
  end

public

  def index
  	@users = User.all
  end

	def new
		@user = User.new
    render 'form'
	end

  def edit
    @user = current_user
    render 'form'
  end

  def update
    current_user.first_name = params[:user][:first_name]
    current_user.last_name = params[:user][:last_name]
    current_user.email = params[:user][:email]
    current_user.save
    flash[:notice] = "Your profil has successfully been updated !"
    redirect_to "/users/#{current_user.id}"
  end

  def show
    @user = current_user
  end

	def create
		@user = User.new(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email])
		@user.save
		redirect_to "/login"
	end

	def enforce_tenancy
	  render unauthorized unless event.user_id == current_user.id
	end
end