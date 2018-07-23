class Search < ApplicationRecord
    validates :keyword, uniqueness: true, presence: true
    validates :num_times, presence: true

    def search_for_keyword
        update_attributes(num_times: num_times + 1)
        monster_search
    end

    def monster_search
        monster_queries = [
            "name LIKE ?", "size LIKE ?", "monster_type LIKE ?", "subtype LIKE ?",
            "alignment LIKE ?", "speed LIKE ?", "damage_vulnerabilities LIKE ?",
            "damage_resistances LIKE ?", "damage_immunities LIKE ?", 
            "condition_immunities LIKE ?", "senses LIKE ?", "languages LIKE ?"]
        query_string = monster_queries.join(" OR ")

        Monster.where(query_string, "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", 
            "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", 
            "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
    end
end
