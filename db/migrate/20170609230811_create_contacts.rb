class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthday
      t.text :address
      t.string :phone
      t.string :photo

      t.timestamps
    end
  end
end
