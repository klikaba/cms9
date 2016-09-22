class CreatePostDefinitions < ActiveRecord::Migration[5.0]
  def change
    create_table :cms9_post_definitions do |t|
      t.string :name
      t.timestamps
    end
  end
end
