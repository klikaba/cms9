class AddMetadataToPostFields < ActiveRecord::Migration[5.0]
  def change
    rename_column :cms9_post_fields, :multiple_choices, :metadata
    change_column :cms9_post_fields, :metadata, :text
  end
end
