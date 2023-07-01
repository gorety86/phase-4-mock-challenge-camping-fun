class Activity < ApplicationRecord
    has_many :signups
    has_many :campers, through: :signups
    # timestamps
end
