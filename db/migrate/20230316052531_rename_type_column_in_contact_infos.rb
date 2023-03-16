class RenameTypeColumnInContactInfos < ActiveRecord::Migration[6.1]
  def change
    rename_column :contact_infos, :type, :info_type
  end
end
