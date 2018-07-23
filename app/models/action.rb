class Action < ApplicationRecord
    validates :name, presence: true

    belongs_to :monster

    enum action_type: [ :action, :ability, :legendary_action ]
end
