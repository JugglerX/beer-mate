class Rating  < ActiveRecord::Base

  belongs_to :user
  belongs_to :beer

  # before_create :default_rating

  validates :rating, :inclusion => {:in => [0,1,2,3,4,5]}

  # def default_rating
  #   self.rating = 0
  # end



end
