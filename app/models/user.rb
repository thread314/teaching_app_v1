class User < ApplicationRecord
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    #attr_accessor :email, :password, :password_confirmation
    has_many :cardstates
end
