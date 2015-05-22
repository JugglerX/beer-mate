class Search
  include HTTParty

  response =
  HTTParty.get("http://rubygems.org/api/v1/versions/httparty.json")
end
