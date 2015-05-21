class Pour
  require 'httparty'

  def self.search(query)
    # options = {:query =&gt; {:api_key =&gt; YOURAPIKEY} }
    response = HTTParty.get("http://api.brewerydb.com/v2/beers?name=#{query}&key=36740918b2332efb1b7dd18ed5adc58f")
    response = JSON.parse(response.body)
    # movie = JSON.parse(response.body)

  end



# Example Usage:
# Get a single beer
# /beer/oeGSxs


# beers?name=ipa
end
