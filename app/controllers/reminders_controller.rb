class RemindersController < ApplicationController
  def index
    @user = current_user
  end

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(reminder_params)
    if @reminder.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def reminder_params
    params.require(:reminder).permit(:image, :title, :genre_id, :outline, :frequency_year, :frequency_month, :frequency_week, :frequency_day, :schedule).merge(user_id: params[:user_id])
  end
end
