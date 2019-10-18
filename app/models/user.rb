class User < ApplicationRecord

    validates :name,
        presence: {message: "You need to type in a username before you can proceed!"},
        length: { maximum: 12 }

end
