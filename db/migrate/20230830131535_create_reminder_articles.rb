class CreateReminderArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :reminder_articles do |t|
      t.references    :reminder,    foreign_key: true
      t.references    :article,     foreign_key: true
      t.timestamps
    end
  end
end
