class Cms9Create < ActiveRecord::Migration[5.0]
  def self.up
    create_table :cms9_post_definitions do |t|
      t.string :name
      t.string :user_id
      t.timestamps
    end
# --------------------------------------------------------
    create_table :cms9_post_fields do |t|
      t.references :post_definition, foreign_key: true
      t.string :name
      t.string :field_type
      t.boolean :required, null: false, default: false
      t.string :metadata
      t.string :user_id
      t.timestamps
    end
# --------------------------------------------------------
    create_table :cms9_posts do |t|
      t.references :post_definition, foreign_key: true
      t.string :user_id
      t.timestamps
    end
# --------------------------------------------------------
    create_table :cms9_fields do |t|
      t.belongs_to :post, index: true
      t.belongs_to :post_field, index: true
      t.text :value
      t.text :image
      t.string :image_uid
      t.string :image_name
      t.string :user_id
      t.timestamps
    end
# --------------------------------------------------------
    create_table :cms9_events do |t|
      t.belongs_to :post, index: true
      t.belongs_to :post_definition, index: true
      t.text :user
      t.string :action
      t.string :deleted_field
      t.timestamps
    end
# --------------------------------------------------------
    create_table :ckeditor_assets do |t|
      t.string  :data_uid, null: false
      t.string  :data_name, null: false
      t.string  :data_mime_type
      t.integer :data_size

      t.integer :assetable_id
      t.string  :assetable_type, limit: 30
      t.string  :type, limit: 30

      t.integer :data_width
      t.integer :data_height

      t.timestamps null: false
    end

    add_index :ckeditor_assets, [:assetable_type, :type, :assetable_id], name: :idx_ckeditor_assetable_type
    add_index :ckeditor_assets, [:assetable_type, :assetable_id], name: :idx_ckeditor_assetable
  end

  def self.down
    drop_table :cms9_post_definitions
    drop_table :cms9_post_fields
    drop_table :cms9_posts
    drop_table :cms9_fields
    drop_table :cms9_events
    drop_table :ckeditor_assets
  end
end
