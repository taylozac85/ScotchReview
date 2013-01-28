class Review < ActiveRecord::Base
  attr_accessible :drink_id, :rating, :review, :review_date, :user_id
  
  belongs_to :user
  belongs_to :drink

  validates :review, :length => { :in => 1..500 }
  validates :drink_id, :rating, :review, :review_date, :user_id, :presence => true
end
