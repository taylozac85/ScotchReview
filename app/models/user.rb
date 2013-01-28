class User < ActiveRecord::Base
  attr_accessible :user_email, :user_name
  
  has_many :reviews

  validates :user_email, :user_name, :presence => true
end
