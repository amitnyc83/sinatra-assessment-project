require 'pry'
class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/teams'
    end
      erb :'/users/signup.html'
  end

  post '/signup' do
    if params[:username] == "" || params[:name] == "" || params[:password] == ""
      redirect '/signup'
    else
      @user = User.create(name: params[:name], username: params[:username], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect '/teams'
    end
  end

  get '/login' do
    if logged_in?
      redirect to '/teams'
    else
      erb :'users/login.html'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/teams'
    else
      redirect to '/login'
    end
  end


    get '/users' do
      if logged_in?
        erb :'/users/edit.html'
      else
        redirect to '/login'
      end
    end

    get '/users/:id' do
      @user = User.find(params[:id])
      @teams = @user.teams
      if logged_in?
        erb :'/users/show.html'
      else
        redirect to '/login'
      end
    end

    post "/users/:id" do
      if params[:name] == "" || params[:username] == ""

       redirect to "/users/#{@user.id}/edit"
     else
       @user = User.find_by_id(params[:id])
       if @user && @user.id == current_user
        @user.update(params[:user])
         @team.save
       redirect to "/users/#{@user.id}"
     else
       redirect to "/users/#{@user.id}/edit"
     end
   end
  end


    patch '/users/:id' do
      @user = User.find(params[:id])
      if @user_id == current_user.id
        @user.update(params[:user])
        @user.save
        redirect "/users/#{@user.id}"
      else
        redirect '/users'
      end
    end



  get '/logout' do
    session.clear
    redirect '/'
  end




end
