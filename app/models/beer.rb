class Beer  < ActiveRecord::Base
  has_many :drinkers
  has_many :users, :through => :drinkers

  # attr_accessor :title, :abv, :ibu, :description, :image, :rating, :total_ratings

  # def initialize(args = {})
  #   @title = args.fetch(:title, "none")
  #   @abv = args.fetch(:abv, "0")
  #   @ibu = args.fetch(:ibu, "0")
  #   @description = args.fetch(:description, "no description")
  #   @image = args.fetch(:image, "no image")
  #   @rating = args.fetch(:rating, 0)
  # end

end
