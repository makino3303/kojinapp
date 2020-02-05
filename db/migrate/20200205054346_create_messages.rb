class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :text
      t.timestamps
    end
  end
end
