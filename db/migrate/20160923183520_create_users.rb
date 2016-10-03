class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users, :options => 'DEFAULT CHARSET=utf8') do |t|
      t.string :password_digest
      t.string :email

      t.string :uid 
      t.string :name
      t.string :nickname
      t.string :location
      t.string :image_url 
      t.string :website
      t.string :url

      t.text :description
      t.date :twitter_created_at

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


