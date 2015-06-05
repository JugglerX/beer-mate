class Pour
  require 'httparty'

  class << self
    attr_accessor :served_from, :total_results
  end

  def self.lookup(query)
    query_removed_spaces = query.gsub(" ", "%20")
    response = HTTParty.get("http://api.brewerydb.com/v2/search?q=#{query_removed_spaces}&type=beer&key=36740918b2332efb1b7dd18ed5adc58f")
    @parsed = response
    # @parsed = JSON.parse(response.body)
  end

  def self.brew
    @total_results = @parsed["totalResults"]
    beers = @parsed["data"]
    # p beers

    @beer_array = []

    beers.each do |beer|
      p beer
      p beer.has_key?("name")
      p beer.has_key?("labels")

      # write guards for all keys and turn into a helper
      beer_image = ""
      if beer.has_key?("labels")
        beer_image = beer["labels"]["medium"]
      else
        beer_image = ""
      end
      p beer_image
      @beer_array << Beer.create(
        title: beer["name"],
        abv: beer["abv"],
        ibu: beer["ibu"],
        description: beer["description"],
        image: beer_image
      )
    end

    @beer_array
  end
end

# @beer_array = []
# if Beer.exists?(title: beer["name"])
#           @served_from = "Local"
#           @beer_array << Beer.find_by(title: beer["name"])
#         else
#           @served_from = "Imported"


#           if beer.has_key?("labels")
#             @image = beer["labels"]["medium"]
#           else
#             @image = ""
#           end
#           @beer_array <<



#       end
#       @beer_array
#       # end
