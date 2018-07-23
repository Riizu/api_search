class Monster < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    has_many :actions

    def self.srd_service
        @srd_service ||= SrdService.new
      end

    def self.update_collection
        monster_list = srd_service.monster_list

        monster_list["results"].each do |result|
            id = result["url"].split("/")[-1]
            monster = @srd_service.find_monster(id)
            create_from_service(monster)
        end
    end

    def self.create_from_service(monster_hash)
        new_monster = find_or_initialize_by(id: monster_hash["index"]) do |monster|
           monster.id = monster_hash["index"]
           monster.name = monster_hash["name"]
           monster.size = monster_hash["size"]
           monster.monster_type = monster_hash["type"]
           monster.subtype = monster_hash["subtype"]
           monster.alignment = monster_hash["alignment"]
           monster.armor_class = monster_hash["armor_class"]
           monster.hit_points = monster_hash["hit_points"]
           monster.hit_dice = monster_hash["hit_dice"]
           monster.speed = monster_hash["speed"]
           monster.strength = monster_hash["strength"]
           monster.dexterity = monster_hash["dexterity"]
           monster.constitution = monster_hash["constitution"]
           monster.intelligence = monster_hash["intelligence"]
           monster.wisdom = monster_hash["wisdom"]
           monster.charisma = monster_hash["charisma"]
           monster.strength_save = monster_hash["strength_save"]
           monster.dexterity_save = monster_hash["dexterity_save"]
           monster.constitution_save = monster_hash["constitution_save"]
           monster.intelligence_save = monster_hash["intelligence_save"]
           monster.wisdom_save = monster_hash["wisdom_save"]
           monster.charisma_save = monster_hash["charisma_save"]
           monster.athletics = monster_hash["athletics_save"]
           monster.acrobatics = monster_hash["acrobatics_save"]
           monster.sleight_of_hand = monster_hash["sleight_of_hand"]
           monster.stealth = monster_hash["stealth"]
           monster.arcana = monster_hash["arcana"]
           monster.history = monster_hash["history"]
           monster.investigation = monster_hash["investigation"]
           monster.nature = monster_hash["nature"]
           monster.religion = monster_hash["religion"]
           monster.animal_handling = monster_hash["animal_handling"]
           monster.insight = monster_hash["insight"]
           monster.medicine = monster_hash["medicine"]
           monster.perception = monster_hash["perception"]
           monster.survival = monster_hash["survival"]
           monster.deception = monster_hash["deception"]
           monster.intimidation = monster_hash["intimidation"]
           monster.performance = monster_hash["performance"]
           monster.persuasion = monster_hash["persuasion"]
           monster.damage_vulnerabilities = monster_hash["damage_vulnerabilities"]
           monster.damage_resistances = monster_hash["damage_resistances"]
           monster.damage_immunities = monster_hash["damage_immunities"]
           monster.condition_immunities = monster_hash["condition_immunities"]
           monster.senses = monster_hash["senses"]
           monster.languages = monster_hash["languages"]
           monster.challenge_rating = monster_hash["challenge_rating"]
        end

        if monster_hash["special_abilities"]
            create_monster_actions_from_service(new_monster, monster_hash["special_abilities"], :ability)
        end

        if monster_hash["actions"]
            create_monster_actions_from_service(new_monster, monster_hash["actions"], :action)
        end

        if monster_hash["legendary_actions"]
            create_monster_actions_from_service(new_monster, monster_hash["legendary_actions"], :legendary_action)
        end

        new_monster.save!
    end

    def self.create_monster_actions_from_service(new_monster, actions_hash, action_type)
        actions_hash.each do |action|
            new_monster.actions.find_or_initialize_by(name: action["name"]) do |new_action|
                new_action.name = action["name"]
                new_action.description = action["desc"]
                new_action.attack_bonus = action["attack_bonus"]
                new_action.damage_dice = action["damage_dice"]
                new_action.damage_bonus = action["damage_bonus"]
                new_action.action_type = Action.action_types[action_type]

                new_action.save
            end
        end
    end
end
