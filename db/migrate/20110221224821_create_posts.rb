class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.text :content
      t.integer :views, :default => 0
      t.text :owner
      
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
