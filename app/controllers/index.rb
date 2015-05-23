configure do
  set :dump_errors, false
end

enable :sessions, :logging

get '/' do
  p params
  p user_logged_in?
  p session

  # if no parameters are passed on the homepage, show the beer not found template.
  if params == {}
    p "no paramter passed"
    return erb :beer_not_found
  end
  lb
  p params[:beer]
  lb

  # get beer from BreweryDB API
  puts "Connecting to API and returning JSON..."
  puts
  @beer = Pour.lookup(params[:beer])
  puts @beer

  puts
  puts "Brewing beer - parsing JSON into Activerecord row or retreiving beer locally from Activerecord..."
  puts
  @draft_beer = Pour.brew
  p @draft_beer

  # tells us if the Beer had already been saved in the database or it's a fresh creation from the API
  p Pour.served_from
  p @served_from

  # if no matches are found from the API the totalResults will not exist, thus redirect to a beer not found page.
  if @beer.has_key?("totalResults") == false
    p "no results found"
    erb :beer_not_found
  else
    p "results found"
    erb :beer
  end

end

post '/' do
  puts "******************************************************"
  p params[:beer]
  redirect "/?beer=#{params[:beer]}"
end
