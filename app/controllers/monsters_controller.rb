class MonstersController < ApplicationController
    def create
        if params[:create_type] == "bulk"
            Monster.update_collection
            redirect_to root_path
        end
    end
end