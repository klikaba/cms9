class CreatePostFields < ActiveRecord::Migration[5.0]
  def change
    create_table :cms9_post_fields do |t|
      t.references :post_definition, foreign_key: true
      t.string :name
      t.string :field_type
      t.boolean :required, null: false, default: false
      t.string :metadata
      t.timestamps
    end
  end
end
