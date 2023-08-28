class RemindersController < ApplicationController
  def new
    @reminder = Reminder.new
  end

  def create
  end
end
