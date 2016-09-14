class CreatePostFields < ActiveRecord::Migration[5.0]
  def change
    create_table :post_fields do |t|
      t.references :post_definition, foreign_key: true
      t.string :name
      t.string :type
      t.timestamps
    end
  end
end