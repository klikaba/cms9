class SetMultipleChoicesForPostFields < ActiveRecord::Migration[5.0]
  def change
    change_table :post_fields do |t|
      t.string :multiple_choices
    end
  end
end
