class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    return if @user == current_user
    redirect_to root_path
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if params[:thumb]
      @user.image.purge
      redirect_to user_path(@user)
    else
      @user.destroy
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:image, :name, :message, :genre_id, :text)
  end

end
