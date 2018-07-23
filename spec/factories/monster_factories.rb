FactoryBot.define do
    factory :monster do
        name "Test"
        size { ["small", "medium", "large", "gargantuan"].sample }
        monster_type { ["humanoid", "aberration", "beast", "undead"].sample }
        subtype { [""].sample }
        alignment { ["lawful good", "neutral good", "chaotic good", "lawful evil", "neutral evil", "chaotic evil", "neutral"].sample }
        armor_class { rand(12..25) }
        hit_points { rand(1..300) }
        hit_dice "1d10"
        speed "30ft"
        strength { rand(8..22) }
        dexterity { rand(8..22) }
        constitution { rand(8..22) }
        intelligence { rand(8..22) }
        wisdom { rand(8..22) }
        charisma { rand(8..22) }
        strength_save { rand(8..22) }
        dexterity_save { rand(8..22) }
        constitution_save { rand(8..22) }
        intelligence_save { rand(8..22) }
        wisdom_save { rand(8..22) }
        charisma_save { rand(8..22) }
        athletics { rand(1..10) }
        acrobatics { rand(1..10) }
        sleight_of_hand { rand(1..10) }
        stealth { rand(1..10) }
        arcana { rand(1..10) }
        history { rand(1..10) }
        investigation { rand(1..10) }
        nature { rand(1..10) }
        religion { rand(1..10) }
        animal_handling { rand(1..10) }
        insight { rand(1..10) }
        medicine { rand(1..10) }
        perception { rand(1..10) }
        survival { rand(1..10) }
        deception { rand(1..10) }
        intimidation { rand(1..10) }
        performance { rand(1..10) }
        persuasion { rand(1..10) }
        damage_vulnerabilities { ["Fire", "Lightning", "Water", "Bludgeoning", "Piercing"].sample(2).join(" ") }
        damage_resistances { ["Fire", "Lightning", "Water", "Bludgeoning", "Piercing"].sample(2).join(" ") }
        damage_immunities { ["Fire", "Lightning", "Water", "Bludgeoning", "Piercing"].sample(2).join(" ") }
        condition_immunities { ["Slowed", "Confused", "Restrained", "Poisoned"].sample(2).join(" ") }
        senses "Darkvision"
        languages { ["Common", "Elven", "Dwarvish", "Abyssal", "Fey"].sample }
        challenge_rating { rand(1..25) }
    end
  end