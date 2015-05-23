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
  p session
  p params[:beer_id]
  p current_user.id
  Drinker.create(beer_id: params[:beer_id], user_id: current_user.id)
  redirect "/users/#{current_user.id}/beers"
end

put '/beers/:beer_id' do
  p params
  p params[:rating]
  # take the rating and run the rating method
  Beer.rate_beer(params[:rating], params[:beer_id])
end


