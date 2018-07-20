class AddDefaultValueForNumTimesInSearch < ActiveRecord::Migration[5.2]
  def change
    change_column :searches, :num_times, :integer, default: 0
  end
end
