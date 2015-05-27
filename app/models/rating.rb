class Rating  < ActiveRecord::Base
  has_many :drinkers
  has_many :users, :through => :drinkers
  has_many :beers, :through => :drinkers
end
