
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #read - all articles
  get '/articles' do
    @articles = Article.all
    erb :index
  end

 # create - form 
 get '/articles/new' do
    erb :new
  end

  #read - single article
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
 
  #create - from form
  post '/articles' do
    @article = Article.create(title: params[:title], content: [params[:content]])
    redirect to "/articles/#{Article.last.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    #!save changes put into forms
    @article.update(title: params[:title], content: params[:content])
    @article.save
    
    redirect to "/articles/#{Article.last.id}"
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect '/articles'
  end

end
