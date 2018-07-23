class AddMonsterToActions < ActiveRecord::Migration[5.2]
  def change
    add_reference :actions, :monster, foreign_key: true
  end
end
