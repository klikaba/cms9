class InitCms9Tables < ActiveRecord::Migration[5.0]
  def change
    create_table "cms9_fields", force: :cascade do |t|
      t.integer  "post_id"
      t.integer  "post_field_id"
      t.string   "value"
      t.text     "image"
      t.string   "image_uid"
      t.string   "image_name"
      t.string   "image_custom_size"
      t.datetime "created_at",    null: false
      t.datetime "updated_at",    null: false
      t.index ["post_field_id"], name: "index_fields_on_post_field_id"
      t.index ["post_id"], name: "index_fields_on_post_id"
    end

    create_table "cms9_post_definitions", force: :cascade do |t|
      t.string   "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "cms9_post_fields", force: :cascade do |t|
      t.integer  "post_definition_id"
      t.string   "name"
      t.string   "field_type"
      t.datetime "created_at",                         null: false
      t.datetime "updated_at",                         null: false
      t.boolean  "required",           default: false, null: false
      t.string   "multiple_choices"
      t.index ["post_definition_id"], name: "index_post_fields_on_post_definition_id"
    end

    create_table "cms9_posts", force: :cascade do |t|
      t.integer  "post_definition_id"
      t.datetime "created_at",         null: false
      t.datetime "updated_at",         null: false
      t.index ["post_definition_id"], name: "index_posts_on_post_definition_id"
    end

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
end
