class AddImageToFieldTable < ActiveRecord::Migration[5.0]
  def change
    add_column :cms9_fields, :image, :text
  end
end
