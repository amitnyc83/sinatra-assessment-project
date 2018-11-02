class UsersController < ApplicationController

  # GET: /owners
  get "/signup" do

      erb :"users/signup.html"
  end

  post "/signup" do
    if params[:name] == "" || params[:username] == "" || params[:password] ==  ""

     redirect "/signup"
    else
     @user = User.create(:name => params[:name], :username => params[:username], :password => params[:password])
     @user.save

     session[:user_id] = @user.id

     redirect "/teams"
    end
  end

  get "/login" do
    if !logged_in?
      erb :"/users/login.html"
    else
      redirect "/teams"
    end
  end


  post "/login" do
    @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect "/teams"
    else
      redirect "users/signup"
    end
  end

  get "/logout" do
    session.clear

    redirect "/login"
  end


  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])

    erb :"/users/show.html"
  end

end
