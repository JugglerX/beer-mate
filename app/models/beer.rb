class Beer  < ActiveRecord::Base
  has_many :drinkers
  has_many :users, :through => :drinkers

  before_save :default_rating

  # attr_accessor :title, :abv, :ibu, :description, :image, :rating, :total_ratings

  # def initialize(args = {})
  #   @title = args.fetch(:title, "none")
  #   @abv = args.fetch(:abv, "0")
  #   @ibu = args.fetch(:ibu, "0")
  #   @description = args.fetch(:description, "no description")
  #   @image = args.fetch(:image, "no image")
  #   @rating = args.fetch(:rating, 0)
  # end

  def default_rating
    self.rating = 0
    self.total_ratings = 0
  end

  def self.rate_beer(user_beer_rating, beer_id)
    # ghetto rating system
    beer = Beer.find(beer_id)
    p "inside rate_beer"
    p beer
    if beer.rating == nil
      @new_rating = user_beer_rating

    else
      @new_rating = beer.rating.to_i / user_beer_rating.to_i
    end

    if beer.total_ratings == nil
      @total_ratings = 0
    end

    p @new_rating
    p @total_ratings
    p @total_ratings += 1
    beer.update(rating: @new_rating)
    beer.update(total_ratings: @total_ratings)
    p @total_ratings
    beer.save
  end
end
