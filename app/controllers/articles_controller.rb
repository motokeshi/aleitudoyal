class ArticlesController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @reminders = @user.reminders.order(:schedule)
    end
  end
end
