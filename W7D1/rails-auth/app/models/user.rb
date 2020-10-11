# require 'bcrypt'
# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    
    attr_reader :password

    before_validation :ensure_session_token
    validates :username, presence: true
    validates :session_token, presence: true
    validates :password_digest, presence: true
    validates :password, length: {minimum: 6, allow_nil: true}


    def self.find_by_credentials(username, password)
        user = User.find_by(username: username) #finds the user in the database with username passed in
        user.password_digest.is_password?(password) ? user : false #checks the password_digest of the user to see if the password passed in is the same after hashing
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        new_token = User.generate_session_token
        self.update_attribute(:session_token, new_token) #updates the attribute in the server now
    end

    def ensure_session_token
        if self.session_token
            return true
        else
            self.session_token = User.generate_session_token
        end
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(@password) #removed the to_s need to be Class Password to run is_password?
    end

    def password_digest #helper method to change the user's password digest from Class String to Class BCrypt::Password
        BCrypt::Password.new(super)
    end
end
