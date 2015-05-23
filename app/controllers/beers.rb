get '/users/:id/beers' do
  @beers = User.find_by(id: params[:id]).beers
  p @beers
  erb :"beers/index"
end

get '/users/:user_id/beers/:beer_id/edit' do
  p params
  p @beer = Beer.find(params[:beer_id])
  erb :"beers/edit"
end


post '/beers' do
  puts
  # p session
  # p params[:beer_id]
  # p current_user.id

  # when saving the beer to the users favourites list we need to check if they have already favourited the beer before we create a new association. if the have already favourited that beer, we should still redirect them to the "my beers" list but not save a duplicate beer and display a message "you've already saved that beer, don't you remember?"

  if Beer.find_by(id: params[:beer_id]).users.find_by(id: current_user.id) == nil
    p "the beer is not in the users favourite list, so let's add the Drinker table association"
    Drinker.create(beer_id: params[:beer_id], user_id: current_user.id)
  else
    p "the beer is already in the users favourite list"
    @message = "That beer is already in your favourites list you dickhead"
  end

  redirect "/users/#{current_user.id}/beers?existing_beer=#{params[:beer_id]}&message=#{@message}"
end

put '/beers/:beer_id' do
  p params
  p params[:rating]
  # take the rating and run the rating method
  beer = Beer.rate_beer(params[:rating], params[:beer_id])
  p beer
  @message = "Rating added"
  redirect "/users/#{current_user.id}/beers?existing_beer=#{params[:beer_id]}&message=#{@message}"
end

put '/users/:user_id/beers/:beer_id/remove' do
  p params
  p params[:rating]
  # Only remove the beer from the users list, do not delete from the database or other users lists.
  @beer_to_remove = Drinker.where(beer_id: params[:beer_id]).find_by(user_id: params[:user_id])
  p @beer_to_remove
  @beer_to_remove.delete
  @message = "Shit beer removed"
  redirect "/users/#{current_user.id}/beers?existing_beer=#{params[:beer_id]}&message=#{@message}"
end

