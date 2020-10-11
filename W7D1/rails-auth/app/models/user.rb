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
    validates :password_digest, presence: { message: "Password can't be blank" }
    validates :password, length: {minimum: 6, allow_nil: true}


    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        user
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        new_token = User.generate_session_token
        self.session_token = new_token
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
        safe_password = BCrypt::Password.create(@password)
        self.password_digest= safe_password.to_s
    end
end
