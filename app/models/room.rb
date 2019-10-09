class Room < ApplicationRecord
    validates :name,
        presence: true,
        length: { minimum: 4, maximum: 12 },
        uniqueness: true
end
