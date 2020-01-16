class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |w|
      w.string :title
      w.text :content
      w.integer :release
      w.string :starring
      w.string :image
      w.timestamps
    end
  end
end
