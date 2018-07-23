require 'rails_helper'

RSpec.describe Monster, type: :model do
  it { should validate_uniqueness_of(:name) }

  it { should validate_presence_of(:name) }

  it { should have_many(:actions) }

  it "can create entries from a service hash" do
    aboleth_hash = {
      "_id"=>"5a52bc6f559f00418e5331b5", "index"=>1, "name"=>"Aboleth", "size"=>"Large", 
      "type"=>"aberration", "subtype"=>"", "alignment"=>"lawful evil", "armor_class"=>17, 
      "hit_points"=>135, "hit_dice"=>"18d10", "speed"=>"10 ft., swim 40 ft.", "strength"=>21, 
      "dexterity"=>9, "constitution"=>15, "intelligence"=>18, "wisdom"=>15, "constitution_save"=>6, 
      "intelligence_save"=>8, "wisdom_save"=>6, "history"=>12, "perception"=>10, "damage_vulnerabilities"=>"", 
      "damage_resistances"=>"", "damage_immunities"=>"", "condition_immunities"=>"", "senses"=>"darkvision 120 ft., passive Perception 20", 
      "languages"=>"Deep Speech, telepathy 120 ft.", "challenge_rating"=>10, 
      "special_abilities"=>[
        {"attack_bonus"=>0, "desc"=>"The aboleth can breathe air and water.", "name"=>"Amphibious"}, 
        {"attack_bonus"=>0, "desc"=>"While underwater, the aboleth is surrounded by transformative mucus. A creature that touches the aboleth or that hits it with a melee attack while within 5 ft. of it must make a DC 14 Constitution saving throw. On a failure, the creature is diseased for 1d4 hours. The diseased creature can breathe only underwater.", "name"=>"Mucous Cloud"}, 
        {"attack_bonus"=>0, "desc"=>"If a creature communicates telepathically with the aboleth, the aboleth learns the creature's greatest desires if the aboleth can see the creature.", "name"=>"Probing Telepathy"}
      ], 
      "actions"=>[
        {"attack_bonus"=>0, "desc"=>"The aboleth makes three tentacle attacks.", "name"=>"Multiattack"}, 
        {"damage_bonus"=>5, "damage_dice"=>"2d6", "attack_bonus"=>9, "desc"=>"Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 12 (2d6 + 5) bludgeoning damage. If the target is a creature, it must succeed on a DC 14 Constitution saving throw or become diseased. The disease has no effect for 1 minute and can be removed by any magic that cures disease. After 1 minute, the diseased creature's skin becomes translucent and slimy, the creature can't regain hit points unless it is underwater, and the disease can be removed only by heal or another disease-curing spell of 6th level or higher. When the creature is outside a body of water, it takes 6 (1d12) acid damage every 10 minutes unless moisture is applied to the skin before 10 minutes have passed.", "name"=>"Tentacle"},
        {"damage_bonus"=>5, "damage_dice"=>"3d6", "attack_bonus"=>9, "desc"=>"Melee Weapon Attack: +9 to hit, reach 10 ft. one target. Hit: 15 (3d6 + 5) bludgeoning damage.", "name"=>"Tail"}, 
        {"attack_bonus"=>0, "desc"=>"The aboleth targets one creature it can see within 30 ft. of it. The target must succeed on a DC 14 Wisdom saving throw or be magically charmed by the aboleth until the aboleth dies or until it is on a different plane of existence from the target. The charmed target is under the aboleth's control and can't take reactions, and the aboleth and the target can communicate telepathically with each other over any distance.\nWhenever the charmed target takes damage, the target can repeat the saving throw. On a success, the effect ends. No more than once every 24 hours, the target can also repeat the saving throw when it is at least 1 mile away from the aboleth.", "name"=>"Enslave (3/day)"}
      ], 
      "legendary_actions"=>[
        {"attack_bonus"=>0, "desc"=>"The aboleth makes a Wisdom (Perception) check.", "name"=>"Detect"}, 
        {"attack_bonus"=>0, "desc"=>"The aboleth makes one tail attack.", "name"=>"Tail Swipe"}, 
        {"attack_bonus"=>0, "desc"=>"One creature charmed by the aboleth takes 10 (3d6) psychic damage, and the aboleth regains hit points equal to the damage the creature takes.", "name"=>"Psychic Drain (Costs 2 Actions)"}
      ], 
      "url"=>"http://www.dnd5eapi.co/api/monsters/1"
    }

    Monster.create_from_service(aboleth_hash)
    aboleth = Monster.find_by(name: "Aboleth")
    aboleth_amphibious = aboleth.actions.find_by(name: "Amphibious")
    aboleth_tail = aboleth.actions.find_by(name: "Tail")
    aboleth_detect = aboleth.actions.find_by(name: "Detect")
    
    expect(aboleth.id).to eq 1
    expect(aboleth.name).to eq "Aboleth"
    expect(aboleth.size).to eq "Large"
    expect(aboleth.monster_type).to eq "aberration"
    expect(aboleth.subtype).to eq ""
    expect(aboleth.alignment).to eq "lawful evil"
    expect(aboleth.armor_class).to eq 17
    expect(aboleth.hit_points).to eq 135
    expect(aboleth.hit_dice).to eq "18d10"
    expect(aboleth.speed).to eq "10 ft., swim 40 ft."
    expect(aboleth.strength).to eq 21
    expect(aboleth.dexterity).to eq 9
    expect(aboleth.constitution).to eq 15 
    expect(aboleth.intelligence).to eq 18
    expect(aboleth.wisdom).to eq 15
    expect(aboleth.charisma).to eq nil
    expect(aboleth.strength_save).to eq nil 
    expect(aboleth.dexterity_save).to eq nil
    expect(aboleth.constitution_save).to eq 6
    expect(aboleth.intelligence_save).to eq 8
    expect(aboleth.wisdom_save).to eq 6
    expect(aboleth.charisma_save).to eq nil 
    expect(aboleth.athletics).to eq nil
    expect(aboleth.acrobatics).to eq nil
    expect(aboleth.sleight_of_hand).to eq nil 
    expect(aboleth.stealth).to eq nil
    expect(aboleth.arcana).to eq nil
    expect(aboleth.history).to eq 12
    expect(aboleth.investigation).to eq nil
    expect(aboleth.nature).to eq nil
    expect(aboleth.religion).to eq nil
    expect(aboleth.animal_handling).to eq nil
    expect(aboleth.insight).to eq nil
    expect(aboleth.medicine).to eq nil
    expect(aboleth.perception).to eq 10
    expect(aboleth.survival).to eq nil
    expect(aboleth.deception).to eq nil
    expect(aboleth.intimidation).to eq nil
    expect(aboleth.performance).to eq nil
    expect(aboleth.persuasion).to eq nil
    expect(aboleth.damage_vulnerabilities).to eq ""
    expect(aboleth.damage_resistances).to eq ""
    expect(aboleth.damage_immunities).to eq ""
    expect(aboleth.condition_immunities).to eq ""
    expect(aboleth.senses).to eq "darkvision 120 ft., passive Perception 20"
    expect(aboleth.languages).to eq "Deep Speech, telepathy 120 ft."
    expect(aboleth.challenge_rating).to eq 10

    expect(aboleth.actions.count).to eq 10
    
    expect(aboleth_amphibious.action_type).to eq "ability"
    expect(aboleth_amphibious.description).to eq "The aboleth can breathe air and water."
    expect(aboleth_amphibious.attack_bonus).to eq 0
    expect(aboleth_amphibious.damage_dice).to eq nil
    expect(aboleth_amphibious.damage_bonus).to eq nil

    expect(aboleth_tail.action_type).to eq "action"
    expect(aboleth_tail.description).to eq "Melee Weapon Attack: +9 to hit, reach 10 ft. one target. Hit: 15 (3d6 + 5) bludgeoning damage."
    expect(aboleth_tail.attack_bonus).to eq 9
    expect(aboleth_tail.damage_dice).to eq "3d6"
    expect(aboleth_tail.damage_bonus).to eq 5

    expect(aboleth_detect.action_type).to eq "legendary_action"
    expect(aboleth_detect.description).to eq "The aboleth makes a Wisdom (Perception) check."
    expect(aboleth_detect.attack_bonus).to eq 0
    expect(aboleth_detect.damage_dice).to eq nil
    expect(aboleth_detect.damage_bonus).to eq nil
  end
end
