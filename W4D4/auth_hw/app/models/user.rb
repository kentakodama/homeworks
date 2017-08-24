# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'bcrypt'

class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true
  validates :session_token, presence: true
  validates :password_digest, presence: { message: 'Password can\'t be blank'}
  validates :password, length: { minimum: 6, allow_nil: true }

  before_validation :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(username, password)
    @user = User.find_by(username: username)

    bcrypt_pw = BCrypt::Password.new(@user.password_digest) #convert string to bcrypt
    if @user && bcrypt_pw.is_password?(password)
      @user
    else
      User.errors.full_message
    end
  end

  def generate_session_token!

    token = SecureRandom::urlsafe_base64
    self.session_token = token
    self.save!
  end

  def ensure_session_token
    generate_session_token! unless self.session_token
  end

  def reset_session_token!
    self.session_token = nil
    generate_session_token
    self.save!
  end

  def password(password)
    @password = password #not really suppse to do this but we set it to test if it works
    self.password_digest = BCrypt::Password.create(password)

  end

end
