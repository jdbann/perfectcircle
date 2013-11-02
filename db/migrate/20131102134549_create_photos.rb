class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :album_id
      t.timestamps
    end
    add_attachment :photos, :photo
  end
end
