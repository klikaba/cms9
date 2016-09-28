class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :cms9_posts do |t|
      t.references :post_definition, foreign_key: true
      t.timestamps
    end
  end
end
