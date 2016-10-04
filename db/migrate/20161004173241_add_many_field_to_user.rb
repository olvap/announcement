class AddManyFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :banner_url, :string
    add_column :users, :pic, :string
  end

  def self.down
    remove_column :users, :banner_url
    remove_column :users, :pic
  end
end
