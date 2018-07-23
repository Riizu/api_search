class ChangeActionTypeToEnum < ActiveRecord::Migration[5.2]
  def change
    remove_column :actions, :action_type

    add_column :actions, :action_type, :integer, default: 0
  end
end
