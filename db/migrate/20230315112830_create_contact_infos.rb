class CreateContactInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_infos do |t|
      t.integer :contact_id
      t.string :type
      t.string :number

      t.timestamps
    end
    add_index :contact_infos, :contact_id
  end
end
