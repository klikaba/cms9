class SetRequiredColumnForPostFields < ActiveRecord::Migration[5.0]
  def change
    change_table :cms9_post_fields do |t|
      t.boolean :required, null: false, default: false
    end
  end

end
