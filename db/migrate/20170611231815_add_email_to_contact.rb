class AddEmailToContact < ActiveRecord::Migration[5.1]
  def change
  	add_column :contacts, :email, :string
  end
end
