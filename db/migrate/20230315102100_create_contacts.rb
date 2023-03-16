class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.integer :user_id

      t.timestamps
    end
    add_index :contacts, :user_id
  end
end
