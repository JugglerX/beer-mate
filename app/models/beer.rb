class Beer  < ActiveRecord::Base
  has_many :drinkers
  has_many :users, :through => :drinkers

  before_create :default_rating

  def default_rating
    self.rating = 0
    self.total_ratings = 0
  end

  def self.rate_beer(user_beer_rating, beer_id)
    # ghetto rating system
    beer = Beer.find(beer_id)
    p "inside rate_beer"

    if beer.total_ratings == 0
      @new_rating = user_beer_rating
    else
      @new_rating = beer.rating.to_i / user_beer_rating.to_i
    end

    @new_rating
    @total_ratings = beer.total_ratings
    @total_ratings += 1
    beer.update(rating: @new_rating.to_i)
    beer.update(total_ratings: @total_ratings.to_i )
    beer.save
    p "beer saved"
    p beer

  end
end
