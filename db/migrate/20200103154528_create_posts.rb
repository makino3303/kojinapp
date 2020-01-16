class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :content
      t.float :rate
      t.references :work, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
