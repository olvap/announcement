class CreateAd < ActiveRecord::Migration
  def change
    create_table(:ads, :options => 'DEFAULT CHARSET=utf8') do |t|
      t.column :tid, :string
      t.column :uid, :string
      
      t.column :title, :string
      t.column :price, :string
      t.column :phone, :string
      t.column :message, :text

      t.column :video, :string
      t.column :image, :string

      t.column :data, :text

      t.column :enabled, :boolean
      t.column :updated_at, :datetime
      t.column :created_at, :datetime
    end
  end

    def down
      drop_table :ads
    end
  end
