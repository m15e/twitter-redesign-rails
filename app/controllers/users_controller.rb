class UsersController < ApplicationController

  def index 
    @users = User.all
  end
  
  def show
    @source = Source.new
    @user = User.find(params[:id])
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      flash[:notice] = 'Account Creation Successfull'
      redirect_to(users_path)
    else
      render('new')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = 'Update Complete!'
      redirect_to(user_path(@user))
    else 
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'No more account :('
    redirect_to(root_path)
  end

  private 

  def user_params
    params.require(:user).permit(:username, :full_name) # TODO: might require edit for photo/cover_img
  end
end
