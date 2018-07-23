class Search < ApplicationRecord
    before_create :check_params

    validates :keyword, uniqueness: true, presence: true
    validates :num_times, presence: true

    def search_for_keyword
        update_attributes(num_times: num_times + 1)
        monster_search
    end

    def monster_search
        monster_queries = [
            "lower(name) LIKE ?", "lower(size) LIKE ?", "lower(monster_type) LIKE ?", "lower(subtype) LIKE ?",
            "lower(alignment) LIKE ?", "lower(speed) LIKE ?", "lower(damage_vulnerabilities) LIKE ?",
            "lower(damage_resistances) LIKE ?", "lower(damage_immunities) LIKE ?", 
            "lower(condition_immunities) LIKE ?", "lower(senses) LIKE ?", "lower(languages) LIKE ?"]
        query_string = monster_queries.join(" OR ")

        Monster.where(query_string, "%#{keyword.downcase}%", "%#{keyword.downcase}%", "%#{keyword.downcase}%", 
            "%#{keyword.downcase}%", "%#{keyword.downcase}%", "%#{keyword.downcase}%", "%#{keyword.downcase}%", "%#{keyword.downcase}%", "%#{keyword.downcase}%", 
            "%#{keyword.downcase}%", "%#{keyword.downcase}%", "%#{keyword.downcase}%")
    end

    def check_params
        self.keyword.downcase!
    end
end
