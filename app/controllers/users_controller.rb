class UsersController < ApplicationController
	before_filter :require_admin

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
			flash[:notice] = 'Registration successful.'
      redirect_to root_url
    else
      render :action => "new"
    end
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Admin details were successfully updated.'
			redirect_to root_url
    else
      render :action => "edit"
    end
  end

end
