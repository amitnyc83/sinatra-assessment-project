require './config/environment'


class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password"
  end


  get '/' do
    if logged_in?
     @teams = Team.all
    erb :'/teams/index.html'
  else
    erb :'/welcome'
  end
 end

  helpers do

    def logged_in?
     !!current_user
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end
end
