
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  # index
  get "/articles" do
    @articles = Article.all
    erb :index
  end

  # new article
  get "/articles/new" do
    @article = Article.new
    erb :new
  end

  # create
    post '/articles' do
      # binding.pry
      @article = Article.create(title: params[:title], content: params[:content])
  #     @article = Article.create(params)
  #     # @article = Article.new(title: params[:title], content: params[:content])
  #     redirect '/articles'
      redirect to "/articles/#{ @article.id }"
   end

  # show
  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  # edit
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  # update
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  #destroy
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end


end

# class ApplicationController < Sinatra::Base
#
#   configure do
#     set :public_folder, 'public'
#     set :views, 'app/views'
#   end
#
#   get '/articles' do
#     @articles = Article.all
#     erb :index
#   end
#
#   get '/articles/new' do
#     erb :new
#   end
#
#   post '/articles' do
#     # binding.pry
#     Article.create(title: params[:title], content: params[:content])
#     # @article = Article.new(title: params[:title], content: params[:content])
#     redirect '/articles'
#   end
#
#   get '/articles/:id' do
#     @articles = Article.find(params[:id])
#     erb :show
#   end
#
#   get '/articles/:id/edit' do
#     @articles = Article.find(params[:id])
#     erb :'/articles/edit'
#   end
#
#   patch '/articles/edit' do
#     @articles = Article.find(params[:id])
#     @todo.update(title: params[:title])
#    redirect '/articles'
#   end
#
#
# end
