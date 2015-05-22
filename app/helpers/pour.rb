class Pour
  require 'httparty'


  def self.lookup(query)
    response = HTTParty.get("http://api.brewerydb.com/v2/beers?name=#{query}&key=36740918b2332efb1b7dd18ed5adc58f")
    @parsed = JSON.parse(response.body)
  end

  def self.brew
    Beer.new(
      title: @parsed["data"][0]["name"],
      abv: @parsed["data"][0]["abv"],
      ibu: @parsed["data"][0]["ibu"],
      description: @parsed["data"][0]["description"],
      image: @parsed["data"][0]["labels"]["medium"]
    )
  end


end
