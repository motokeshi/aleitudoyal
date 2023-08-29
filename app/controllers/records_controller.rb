class RecordsController < ApplicationController
  def create
    reminder = Reminder.find(params[:reminder_id])
    record = Record.create(implementation_record: Date.today, reminder_id: reminder.id)
    new_schedule = reminder.next_schedule_calculation(record.implementation_record, reminder.frequency_year, reminder.frequency_month, reminder.frequency_week, reminder.frequency_day)
    reminder.update(schedule: new_schedule)
    if params[:root]
      redirect_to root_path
    else
      redirect_to reminders_path
    end
  end
end
