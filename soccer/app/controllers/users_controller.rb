require 'rack-flash'
require 'pry'

class UsersController < ApplicationController
 use Rack::Flash

  get '/signup' do
    if logged_in?
      session.clear

      erb :'users/signup.html'
    else
      erb :'users/signup.html'
    end
  end

  post '/signup' do
   user = User.new(params)
    if user.save
     session[:user_id] = user.id

     flash[:message] = "Thank you for Signing up to the Soccer App. Welcome #{user.username}!"

     redirect to '/'
    else
     redirect to '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :"/users/login.html"
    else
      redirect to '/teams'
    end
  end


  post "/login" do
    user = User.find_by(username: params[:username])
     if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      @user = current_user

      flash[:message] = "Welcome back, #{@user.username}!"

      redirect to "/teams"
    else

      flash[:message] = "Your username and password does not match. Please try again."
      redirect to "/users/login"
    end
  end



  get "/users/:slug" do
    #binding.pry
     @user = User.find_by_slug(params[:slug])
     if @user && @user.id == current_user
      erb :"/users/show.html"
    else
      redirect to "/login" 
    end
  end


  get "/users/:slug/edit" do
    @user = User.find_by_slug(params[:slug])
    if @user && @user == current_user
      erb :"/users/edit.html"
    else
      redirect to "login"
    end
  end


  patch "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    if @user.authenticate(params[:password])
      @user.update(name: params[:name], username: params[:username])
      redirect to "/users/#{user.slug}"
    else
      redirect to "/users/#{user.slug}/edit"
    end
  end






  get "/logout" do
      session.clear
      redirect to "/login"
  end
end
