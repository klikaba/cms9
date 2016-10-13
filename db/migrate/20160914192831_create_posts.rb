class CreatePosts < ActiveRecord::Migration[5.0]
  def self.up
    create_table :cms9_posts do |t|
      t.references :post_definition, foreign_key: true
      t.timestamps
    end
  end

  def self.down
    drop_table :cms9_posts
  end
end
