class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :username
      t.string :email

      t.string :twitter_id
      t.string :twitter_username
      t.string :twitter_name
      t.string :twitter_description
      
      t.string :twitter_pic
      t.string :twitter_location
      t.string :twitter_url
      t.string :twitter_created_at

      t.text :description
      t.string :account_type 
      t.date :update_at
    end
  end

  def down
    drop_table :users
  end
end

=begin
:binary :boolean :date :datetime :decimal :float :integer
:bigint :primary_key :references :string :text :time :timestamp
=end


