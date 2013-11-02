class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.string :author
      t.text :body
      t.date :expiry_date
      t.text :extended
      t.string :author_date

      t.timestamps
    end
  end
end
