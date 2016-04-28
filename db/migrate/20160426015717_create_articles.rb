class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      
      t.string "title"
      t.text    "description"
      t.date    "date"
      t.string  "tags"
    end
  end
end
