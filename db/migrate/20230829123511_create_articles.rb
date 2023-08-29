class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string      :title,     null: false
      t.integer     :genre_id
      t.boolean     :release,   null: false,    default: false
      t.references  :user,      null: false,    foreign_key: true
      t.references  :reminder,                  foreign_key: true
      t.timestamps
    end
  end
end
