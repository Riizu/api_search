class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.string :name
      t.string :description
      t.integer :attack_bonus
      t.string :damage_dice
      t.integer :damage_bonus
      t.string :type

      t.timestamps
    end
  end
end
