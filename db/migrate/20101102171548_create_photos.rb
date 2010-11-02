class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.integer :calculated_rating
      t.boolean :is_visible, :default => true

      t.timestamps
    end

    add_index :photos, :user_id
    add_index :photos, :is_visible
  end

  def self.down
    drop_table :photos
  end
end

