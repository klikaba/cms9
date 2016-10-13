class CreateFields < ActiveRecord::Migration[5.0]
  def change
    create_table :cms9_fields do |t|
      t.belongs_to :post, index: true
      t.belongs_to :post_field, index: true
      t.text :value
      t.text :image
      t.string :image_uid
      t.string :image_name
      t.timestamps
    end
  end
end
