post '/users' do

  if(params[:login_type] == "in")
    # need to check the password matches
    @user = User.find_by(username: params[:username])
    session[:user_id] = @user.id
    p params[:username]
    p params[:password_hash]
    puts
    p @user.username
    p @user.password
    if @user.password == params[:password]
      puts "user login success"
      redirect "/users/#{session[:user_id]}"
    else
      puts "user login password failed"
      redirect "/"
    end
  end

  if(params[:login_type] == "up")
    @user = User.create(username: params[:username], password: params[:password_hash])
    p @user
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
  p current_user
  erb :"users/show"
end


post '/logout' do
  p session
  session[:user_id] = nil
  p session
  redirect '/'
end

# rabies route to clear dirty sessions
get '/clear' do
  session[:user_id] = nil
  redirect '/'
end




