class Drink < ActiveRecord::Base
  attr_accessible :average_rating, :description, :drink_name
  
  has_many :reviews

  validates :description, :length => { :in => 1..1000 }
  validates :average_rating, :description, :drink_name, :presence => true
end
