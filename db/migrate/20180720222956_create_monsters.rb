class CreateMonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :size
      t.string :type
      t.string :subtype
      t.string :alignment
      t.integer :armor_class
      t.integer :hit_points
      t.string :hit_dice
      t.string :speed
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
      t.integer :strength_save
      t.integer :dexterity_save
      t.integer :constitution_save
      t.integer :intelligence_save
      t.integer :wisdom_save
      t.integer :charisma_save
      t.integer :athletics
      t.integer :acrobatics
      t.integer :sleight_of_hand
      t.integer :stealth
      t.integer :arcana
      t.integer :history
      t.integer :investigation
      t.integer :nature
      t.integer :religion
      t.integer :animal_handling
      t.integer :insight
      t.integer :medicine
      t.integer :perception
      t.integer :survival
      t.integer :deception
      t.integer :intimidation
      t.integer :performance
      t.integer :persuasion
      t.string :damage_vulnerabilities
      t.string :damage_resistances
      t.string :damage_immunities
      t.string :condition_immunities
      t.string :senses
      t.string :languages
      t.integer :challenge_rating

      t.timestamps
    end
  end
end
