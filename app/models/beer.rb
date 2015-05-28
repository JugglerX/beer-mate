class Beer  < ActiveRecord::Base

  has_many :drinkers
  has_many :ratings
  has_many :users, through: :drinkers

  belongs_to :breweries

  def rate_beer
    puts "*************************************"
    puts "ghetto rating system"
    puts "*************************************"

    beer = Beer.find(self.id)

    logger.info beer.id
    logger.info beer.ratings.count()

    sum = 0
    beer.ratings.each do |rating_row|
      p rating_row.rating
      sum += rating_row.rating
    end
    p sum

    count = beer.ratings.count()

    sum == 0 ? 0 : (sum / count)
  end

  def total_ratings
    beer = Beer.find(self.id)
    beer.ratings.count()
  end

end
