# Beer favourites list "My Beers"
get '/users/:id/beers' do
  @beers = User.find_by(id: params[:id]).beers
  @user_ratings = User.find_by(id: params[:id]).ratings
  p @beers
  p @ratings
  erb :"beers/index"
end


# Rating Form
get '/users/:user_id/beers/:beer_id/edit' do
  p params
  p @beer = Beer.find(params[:beer_id])
  erb :"beers/edit"
end

get '/beers/:beer_id' do
  @beer = Beer.find(params[:beer_id])
  erb :"beers/show"
end


# Add beer to users favourites
post '/beers' do
  beer = Beer.find(params[:beer_id])
  if current_user == nil
    redirect "/users/login"
  end
  unless current_user.beers.include? beer
    logger.info "the beer is not in the users favourite list"
    current_user.beers << beer
  else
    logger.info "the beer is already in the users favourite list"
    @message = "That beer is already in your favourites list you dickhead"
  end
  redirect "/users/#{current_user.id}/beers?existing_beer=#{params[:beer_id]}&message=#{@message}"
end


# Add rating
put '/beers/:beer_id' do

  @beer = Beer.where(id: params[:beer_id]).first

  @rating = @beer.ratings.where(user_id: current_user.id).first_or_create.update(rating: params[:rating], user_id: current_user.id)

  { rating_user: params[:rating], rating_global: @beer.rate_beer, rating_count: @beer.total_ratings }.to_json
  # @message = "Rating added"
  # redirect "/users/#{current_user.id}/beers?existing_beer=#{params[:beer_id]}&message=#{@message}"
end

# Remove beer from user favourites
put '/users/:user_id/beers/:beer_id/remove' do

  Drinker.where(beer_id: params[:beer_id]).find_by(user_id: params[:user_id]).delete

  @message = "Shit beer removed"
  redirect "/users/#{current_user.id}/beers?existing_beer=#{params[:beer_id]}&message=#{@message}"
end

private


