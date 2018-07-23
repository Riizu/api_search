class RenameTypeColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :monsters, :type, :monster_type
    rename_column :actions, :type, :action_type
  end
end
