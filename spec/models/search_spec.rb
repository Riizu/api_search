require 'rails_helper'

RSpec.describe Search, type: :model do
  it { should validate_presence_of(:keyword) }
  it { should validate_presence_of(:num_times) }

  it { should validate_uniqueness_of(:keyword) }

  it "Searches monster data for a specific keyword" do
    monster_1 = create(:monster)
    monster_2 = create(:monster)
    monster_3 = create(:monster, senses: "None")
    search_1 = Search.create(keyword: "Darkvision")
    search_2 = Search.create(keyword: "Monster 1")
    
    results_1 = search_1.search_for_keyword
    results_2 = search_2.search_for_keyword

    expect(search_1.num_times).to eq 1
    expect(search_2.num_times).to eq 1

    expect(results_1).to include(monster_1)
    expect(results_1).to include(monster_2)
    expect(results_1).not_to include(monster_3)

    expect(results_2).to include(monster_1)
    expect(results_2).not_to include(monster_2)
    expect(results_2).not_to include(monster_3)
  end

  it "Increases search count for a given search" do
    search = Search.create(keyword: "Search")

    search.search_for_keyword
    search.search_for_keyword
    search.search_for_keyword

    expect(search.num_times).to eq 3
  end
end
