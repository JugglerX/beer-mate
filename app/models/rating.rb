class Rating  < ActiveRecord::Base

  belongs_to :user
  belongs_to :beer

  validates :rating, :inclusion => {:in => [0,1,2,3,4,5]}

end
