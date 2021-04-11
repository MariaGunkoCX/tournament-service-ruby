class User < ApplicationRecord
    validates_presence_of :first_name, :last_name, :email
    validates_length_of :first_name, :maximum => 25
    validates_length_of :last_name, :maximum => 25
    validates_uniqueness_of :email
end
