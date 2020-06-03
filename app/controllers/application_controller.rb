
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

    #new
  get '/articles/new' do
    @articles = Article.new
    erb :new
  end

    #create
  post '/articles' do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end

  #index
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #show
  get '/articles/:id' do
    @article = Article.find(params["id"])
    erb :show
  end

    #edit
  get '/articles/:id/edit' do
    @article = Article.find(params["id"])
    erb :edit
  end

  #update
  patch '/articles/:id' do
    id = params["id"]
    new_params = {}
    old_article = Article.find(id)
    new_params[:title] = params["title"]
    new_params[:content] = params["content"]
    old_article.update(new_params)
    redirect "/articles/#{id}"
  end

  #delete
  
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end
end
