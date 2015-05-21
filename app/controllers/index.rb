configure do
  set :dump_errors, false
end

get '/' do
  puts "******************************************************"
  p params[:beer]
  p @beer = Pour.search(params[:beer])
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

# get '/articles' do
#   @categories = Category.all
#   @articles = Article.all
#   erb :"articles/index"
# end

# get '/articles/new' do
#   @errors = []
#   @article = Article.new
#   erb :"articles/new"
# end

# post '/articles' do
#   @article = Article.create(params)
#   p @article
#   @errors = []
#   if @article.persisted?
#     # erb :"articles/show_key"
#     redirect "/articles/#{@article.id}?success=true"
#   else
#     @errors += @article.errors.full_messages
#     p @errors
#     erb :"articles/new"
#   end
# end

# get '/articles/:id' do
#   @article = Article.find(params[:id])
#   @success = params[:success]
#   p @success
#   p @article
#   erb :"articles/show"
# end

# get '/articles/:id/edit' do
#   @errors = []
#   @article = Article.find(params[:id])
#   erb :"articles/edit"
# end


# put '/articles/:id' do
#   @errors = []
#   @article = Article.find(params[:id])
#   p params
#   if params[:secret_key] == @article.secret_key
#     @article.update(title: params[:title], description: params[:description], price: params[:price], author_email: params[:author_email], category_id: params[:category_id] )
#     p "success"
#     p @article
#     redirect "/articles/#{params[:id]}"
#   else
#     p "failure"
#     p @article
#     @errors << "Secret key is incorrect"
#     erb :"articles/edit"
#   end
# end
