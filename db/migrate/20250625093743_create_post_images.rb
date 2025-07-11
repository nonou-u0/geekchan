class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.references :blog, null: false, foreign_key: true
      t.timestamps
    end
  end
end
