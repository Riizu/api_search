require 'rails_helper'

RSpec.describe SrdService, :vcr do
  it "has a base connection" do
    srds = SrdService.new
    url_prefix = srds.connection.url_prefix.to_s

    expect(url_prefix).to eq "http://www.dnd5eapi.co/api/"
  end

  it "can pull a complete list of monsters" do
    srds = SrdService.new

    monsters = srds.monster_list

    expect(monsters["count"]).to be >= 325
    expect(monsters["results"][0]["name"]).not_to eq nil 
  end

  it "can pull a monster" do
    srds = SrdService.new

    monster = srds.find_monster(1)

    expect(monster["name"]).to eq "Aboleth"
  end
end