class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :username
      t.string :email

      t.string :uid
      t.string :name
      t.string :nickname
      t.string :token
      t.string :secret
      t.string :description
      
      t.string :pic
      t.string :location
      t.string :url
      t.date :created_at

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


