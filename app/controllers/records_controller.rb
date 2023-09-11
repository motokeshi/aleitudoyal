class RecordsController < ApplicationController
  def create
    reminder = Reminder.find(params[:reminder_id])
    if params[:skip]
      new_schedule = reminder.next_schedule_calculation(reminder.schedule, reminder.frequency_year, reminder.frequency_month, reminder.frequency_week, reminder.frequency_day)
    else
      record = Record.create(implementation_record: Date.today, reminder_id: reminder.id)
      new_schedule = reminder.next_schedule_calculation(record.implementation_record, reminder.frequency_year, reminder.frequency_month, reminder.frequency_week, reminder.frequency_day)
    end
    reminder.update(schedule: new_schedule)
    if params[:root]
      redirect_to root_path
    elsif params[:show]
      redirect_to reminder_path(reminder)
    else
      redirect_to reminders_path
    end
  end

  def edit
    @reminder = Reminder.find(params[:reminder_id])
    @record = Record.find(params[:id])
    if @reminder.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @reminder = Reminder.find(params[:reminder_id])
    @record = Record.find(params[:id])
    if @record.update(params.require(:record).permit(:implementation_record).merge(reminder_id: params[:reminder_id]))
      redirect_to reminder_path(params[:reminder_id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    record = Record.find(params[:id])
    if record.destroy
      redirect_to reminder_path(params[:reminder_id])
    else
      render :edit, status: :unprocessable_entity
    end
  end
end
