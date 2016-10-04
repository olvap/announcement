class AddVerifiedFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :verified, :boolean
  end

  def self.down
    remove_column :users, :verified
  end
end
