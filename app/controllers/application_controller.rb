
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end




get '/articles/new' do
  @article = Article.new(params[:article])
  #display the form
  erb :index
  #HOW TO REDIRECT???
    redirect '/articles/:id'
#NEEDS TO REDIRECT TO articles/:id
end













  # get '/' do
  # end

  # get '/show' do
  #   @articles = Article.all
  #   erb :show
  # end

  # get '/article' do
  #   @articles = Article.all
  #   erb :index
  # end

end
