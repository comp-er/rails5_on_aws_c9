class AddNameToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :name, :string
  end
end
