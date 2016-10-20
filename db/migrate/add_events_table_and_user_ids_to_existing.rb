class AddEventsTableAndUserIdsToExisting < ActiveRecord::Migration[5.0]
  def self.up
    add_column :cms9_post_definitions, :user_id, :string
    add_column :cms9_post_fields, :user_id, :string
    add_column :cms9_posts, :user_id, :string
    add_column :cms9_fields, :user_id, :string

    create_table :cms9_events do |t|
      t.belongs_to :post, index: true
      t.belongs_to :post_definition, index: true
      t.text :user
      t.string :action
      t.string :deleted_field
      t.timestamps
    end
  end

  def self.down
    remove_column :cms9_post_definitions, :user_id
    remove_column :cms9_post_fields, :user_id
    remove_column :cms9_posts, :user_id
    remove_column :cms9_fields, :user_id
    drop_table :cms9_events
  end
end
