class User  < ActiveRecord::Base
  has_many :drinkers
  has_many :beers, :through => :drinkers
end
