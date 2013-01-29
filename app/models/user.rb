# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string(255)
#  user_email      :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :user_email, :user_name, :password, :password_confirmation
  has_secure_password

  has_many :reviews

  # used to ensure email uniqueness because not all database adapters
  # use case-sensitive indices
  before_save { |user| user.user_email = user_email.downcase }

  validates :user_name, :presence => true, :length => { :maximum => 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :user_email, :presence => true, 
  						 :format => { with: VALID_EMAIL_REGEX }, 
  						 :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true, :length => { :minimum => 6 }
  validates :password_confirmation, :presence => true
end
