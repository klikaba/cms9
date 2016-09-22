class SetMultipleChoicesForPostFields < ActiveRecord::Migration[5.0]
  def change
    change_table :cms9_post_fields do |t|
      t.string :multiple_choices
    end
  end
end
