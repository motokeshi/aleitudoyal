class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.string      :title,           null: false
      t.integer     :genre_id
      t.text        :outline
      t.date        :frequency_year
      t.date        :frequency_month
      t.date        :frequency_week
      t.date        :frequency_day
      t.references  :user,            foreign_key: true
      t.timestamps
    end
  end
end
