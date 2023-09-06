class RemindersController < ApplicationController
  before_action :set_reminder, only: [:show, :edit, :update, :destroy, :search]

  def index
    @user = current_user
    @reminders = @user.reminders.order(:schedule)
  end

  def show
    @records = @reminder.records.order(implementation_record: :desc)
    @articles = @reminder.articles
  end

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(reminder_params)
    if @reminder.save
      redirect_to reminders_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @reminder.update(reminder_params)
      redirect_to reminders_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @reminder.destroy
      redirect_to reminders_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  def search
    @articles = Article.articles_search(params[:keyword])
  end

  def relation
    reminder_article = ReminderArticle.new(reminder_id: params[:id], article_id: params[:article_id])
    reminder_article.save
    redirect_to reminder_path(params[:id])
  end

  def cancellation
    reminder_article = ReminderArticle.find_by(reminder_id: params[:id], article_id: params[:format])
    reminder_article.destroy
    redirect_to reminder_path(params[:id])
  end

  private
  def reminder_params
    params.require(:reminder).permit(:image, :title, :genre_id, :outline, :frequency_year, :frequency_month, :frequency_week, :frequency_day, :schedule).merge(user_id: current_user.id)
  end

  def set_reminder
    @reminder = Reminder.find(params[:id])
  end
end
