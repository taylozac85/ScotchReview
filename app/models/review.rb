# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  review_date :date
#  rating      :integer
#  review      :text
#  user_id     :integer
#  drink_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Review < ActiveRecord::Base
  attr_accessible :drink_id, :rating, :review, :review_date, :user_id
  
  belongs_to :user
  belongs_to :drink

  validates :review, :length => { :in => 1..500 }
  validates :drink_id, :rating, :review, :review_date, :user_id, :presence => true
end
