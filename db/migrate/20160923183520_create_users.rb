class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users, :options => 'DEFAULT CHARSET=utf8') do |t|
      t.column :password_digest, :string
      t.column :email, :string

      t.column :uid, :string
      t.column :name, :string
      t.column :nickname, :string
      t.column :location, :string
      t.column :image_url , :string
      t.column :website, :string
      t.column :url, :string

      t.column :description, :text
      t.column :twitter_created_at, :datetime

      t.column :account_type, :string
      t.column :update_at, :datetime
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


