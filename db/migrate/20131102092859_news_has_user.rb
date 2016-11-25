class NewsHasUser < ActiveRecord::Migration
  def change
    add_column :news, :user_id, :string
  end
end
