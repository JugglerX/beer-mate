post '/users' do
  if(params[:login_type] == "in")
    # need to check the password matches
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
    else
      redirect "/login"
    end
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
  erb :"users/show"
end

post '/logout' do
  session[:user_id] = nil
  redirect '/'
end

# rabies route to clear dirty sessions
get '/clear' do
  session[:user_id] = nil
  redirect '/'
end

