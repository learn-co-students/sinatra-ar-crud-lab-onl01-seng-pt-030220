
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  get '/articles/new' do

    erb :new
  end

  get '/articles' do
    @article = Article.all

    erb :index
  end

  post '/articles' do
    @article = Article.create(params[:article])


    erb :show
  end

  get '/articles/:id' do
    @article = Articles.find(params[:id])

    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])

    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:edit_article])
    @article.save

    erb :show
  end

  delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    @article.destroy

    erb :delete
  end

end