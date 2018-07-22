class SrdService < BaseService
    attr_reader :connection

    def initialize
        @connection = Faraday.new("http://www.dnd5eapi.co/api/")
    end

    def monster_list
        response = @connection.get("monsters")
        parse(response)
    end

    def find_monster(id)
        response = @connection.get("monsters/#{id}")
        parse(response)
    end
end