configure do
  set :dump_errors, false
end

enable :sessions, :logging

get '/' do
  erb :index
end

post '/' do
  # If no parameters are passed to the homepage, show the beer not found template.
  if params == {}
    p "no paramter passed"
    return erb :index
  end

  # Get beer from BreweryDB API
  logger.info "Connecting to API and returning JSON..."
  @beer = Pour.lookup(params[:beer])

  # Check to see if we get results from the API
  if @beer.has_key?("totalResults") == false
    p "no results found"
    return erb :beer_not_found
  end

  # Parse the JSON packet into Activerecord as a Beer object
  logger.info "Brewing beer - parsing JSON into Activerecord row or retreiving beer locally from Activerecord..."
  @draft_beer = Pour.brew
  p @draft_beer

  # Checks if the Beer had already been saved in the database and gives us a flag: "local" or "imported"
  @served_from = Pour.served_from

  erb :beer
end

get '/about' do
  erb :about
end





# get '/' do
#   p params
#   p user_logged_in?
#   p session

#   # if no parameters are passed on the homepage, show the beer not found template.
#   if params == {}
#     p "no paramter passed"
#     return erb :index
#   end
#   lb
#   p params[:beer]
#   lb

#   # get beer from BreweryDB API
#   puts "Connecting to API and returning JSON..."
#   puts
#   @beer = Pour.lookup(params[:beer])
#   puts @beer

#   if @beer.has_key?("totalResults") == false
#     p "no results found"
#     return erb :beer_not_found
#   end

#   puts
#   puts "Brewing beer - parsing JSON into Activerecord row or retreiving beer locally from Activerecord..."
#   puts
#   @draft_beer = Pour.brew
#   p @draft_beer

#   # tells us if the Beer had already been saved in the database or it's a fresh creation from the API
#   p Pour.served_from
#   p @served_from

#   # if no matches are found from the API the totalResults will not exist, thus redirect to a beer not found page.

#   p "results found"
#   erb :beer
# end
