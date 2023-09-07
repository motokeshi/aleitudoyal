class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    if user_signed_in?
      @user = current_user
      @today_reminders = Reminder.where(user_id: current_user.id).where("schedule<=?", Date.today)
    else
      redirect_to articles_path
    end
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.order(updated_at: :desc).with_attached_image
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
