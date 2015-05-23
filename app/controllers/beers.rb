get '/beers' do

end

post '/beers' do
  puts
  p session
  p params[:beer_id]
  p current_user.id
  Drinker.create(beer_id: params[:beer_id], user_id: current_user.id)
  redirect "/users/#{current_user.id}/beers"
end

get '/users/:id/beers' do
  @beers = User.find_by(id: params[:id]).beers
  p @beers
  erb :"beers/index"
end
