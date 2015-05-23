configure do
  set :dump_errors, false
end

enable :sessions, :logging

get '/' do
  p params
  p user_logged_in?

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
  puts "Brewing beer - parsing JSON into Activerecord..."
  puts
  @fresh_beer = Pour.brew
  @fresh_beer.save

  puts
  puts "Serving beer - saving parsed activerecord row"
  puts
  p @fresh_beer
  puts

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
