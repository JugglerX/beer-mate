class Beer  < ActiveRecord::Base
  has_many :drinkers
  has_many :users, :through => :drinkers
end
