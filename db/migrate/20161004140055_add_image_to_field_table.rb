class AddImageToFieldTable < ActiveRecord::Migration[5.0]
  def self.up
    add_column :cms9_fields, :image,  :text
    add_column :cms9_fields, :image_uid,  :string
    add_column :cms9_fields, :image_name, :string
    add_column :cms9_fields, :image_custom_size, :string
  end
  def self.down
    remove_column :cms9_fields, :image
    remove_column :cms9_fields, :image_uid
    remove_column :cms9_fields, :image_name
    remove_column :cms9_fields, :image_custom_size
  end
end
