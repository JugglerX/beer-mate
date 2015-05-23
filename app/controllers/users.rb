post '/users' do
  # @user = User.new(id: -1)
  if(params[:login_type] == "in")
    # need to check the password matches
    @user = User.find_by(username: params[:username])
    p @user.id
    p params
    session[:user_id] = @user.id
    redirect "/users/#{session[:user_id]}"
  end

  if(params[:login_type] == "up")
    @user = User.create(username: params[:username], password: params[:password])
    p @user
    # first_name: params[:first_name], last_name: params[:last_name], email: params[:email].downcase
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  end
end

get '/users/new' do
  erb :"users/new"
end

get '/users/login' do
  erb :"users/login"
end

get '/users/:id' do
  p session
  erb :"users/show"
end


post '/logout' do
  session[:user] = nil
  redirect '/'
end

# rabies route to clear dirty sessions
get '/clear' do
  session[:user_id] = nil
  redirect '/'
end




