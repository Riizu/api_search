class Search < ApplicationRecord
    validates :keyword, uniqueness: true, presence: true
    validates :num_times, presence: true
end
