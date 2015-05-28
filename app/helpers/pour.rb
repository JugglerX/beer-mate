class Pour
  require 'httparty'

  class << self
    attr_accessor :served_from
  end

  def self.lookup(query)
    query_removed_spaces = query.gsub(" ", "%20")
    response = HTTParty.get("http://api.brewerydb.com/v2/beers?name=#{query_removed_spaces}&key=36740918b2332efb1b7dd18ed5adc58f")
    @parsed = JSON.parse(response.body)
  end

  def self.brew
    if Beer.exists?(title: @parsed["data"][0]["name"])
      @served_from = "Local"
      Beer.find_by(title: @parsed["data"][0]["name"])
    else
      @served_from = "Imported"
      Beer.create(
        title: @parsed["data"][0]["name"],
        abv: @parsed["data"][0]["abv"],
        ibu: @parsed["data"][0]["ibu"],
        description: @parsed["data"][0]["description"],
        image: @parsed["data"][0]["labels"]["medium"]
      )
    end
  end
end
