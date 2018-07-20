class Action < ApplicationRecord
    validates :name, presence: true

    belongs_to :monster
end
