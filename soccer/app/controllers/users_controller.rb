class UsersController < ApplicationController


  get "/signup" do
    if !logged_in?
      erb :"users/signup.html"
    else
      redirect to "/teams"
    end
  end

  post "/signup" do
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id

      redirect to "/teams"
    else
      redirect to "/signup"
    end
  end

  get "/login" do
    if !logged_in?
      erb :"/users/login.html"
    else
      redirect to "/teams"
    end
  end


  post "/login" do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect to "/teams"
    else
      redirect to "/users/login"
    end
  end

  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    if @user && @user == current_user
      erb :"/users/show.html"
    else
      redirect to "/login"
    end
  end


  get "/users/:slug/edit" do
    @user = User.find_by_slug(params[:slug])
    if @user && @user == current_user
      erb :"/users.edit.html"
    else
      redirect to "login"
    end
  end


  patch "/users/:slug" do
    user = User.find_by_slug(params[:slug])
    if user.authenticate(params[:password])
      user.update(params[:user])
      redirect to "/users/#{user.slug}"
    else
      redirect to "/users/#{user.slug}/edit"
    end
  end




  get "/logout" do
    if logged_in?
      session.clear
      redirect "/login"
    else
      redirect to '/'
    end
  end




end
