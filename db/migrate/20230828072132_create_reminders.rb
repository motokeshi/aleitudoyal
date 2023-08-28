class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.string      :title,           null: false
      t.integer     :genre_id
      t.text        :outline
      t.integer     :frequency_year
      t.integer     :frequency_month
      t.integer     :frequency_week
      t.integer     :frequency_day
      t.references  :user,            foreign_key: true
      t.timestamps
    end
  end
end
