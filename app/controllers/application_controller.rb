
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do 
  erb :new
  end

  post '/articles' do 
  @new_article = Article.create(title: params[:title], content:params[:content])
  id = @new_article[:id]
  redirect :"/articles/#{id}"
  end


  get '/articles' do 
  @articles = Article.all
  erb :index
  end

  get '/articles/:id' do 
  @article = params[:id]
  erb :show
  end

  get '/articles/:id/edit' do 
  id = params[:id].to_i
  @article = Article.all.select{|a|a.id == id}
  @article.flatten
  erb :edit
  end

  patch '/articles/:id' do 
  @edit = Article.update(title: params[:title],content:params[:content],id:params[:id])
end

delete '/articles/:id' do 
id = params[:id].to_i
Article.find(id).delete
end


end
