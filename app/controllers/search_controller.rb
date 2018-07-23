class SearchController < ApplicationController
    def index
        @search = Search.new()
    end

    def create
        params[:search][:keyword].downcase!
        search = Search.find_or_create_by(search_params)
        redirect_to search_path(search)
    end

    def show
        @search = Search.find(params[:id])
        @searches = Search.order(keyword: :desc)
        @results = @search.search_for_keyword
    end

    def search_params
        params.require(:search).permit(:keyword)
    end
end