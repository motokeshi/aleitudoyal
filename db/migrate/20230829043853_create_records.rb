class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.date :implementation_record, null: false
      t.references :reminder, foreign_key: true
      t.timestamps
    end
  end
end
