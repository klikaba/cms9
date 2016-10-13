class CreatePostDefinitions < ActiveRecord::Migration[5.0]
  def self.up
    create_table :cms9_post_definitions do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :cms9_post_definitions
  end
end
