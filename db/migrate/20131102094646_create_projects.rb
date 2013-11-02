class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :body
      t.string :location
      t.string :project_date
      t.date :expiry_date
      t.text :extended

      t.timestamps
    end
  end
end
