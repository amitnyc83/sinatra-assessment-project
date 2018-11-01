class OwnersController < ApplicationController

  # GET: /owners
  get "/signup" do
    if !logged_in?

      erb :"owners/signup.html"
    else
      redirect "/teams"
    end
  end

  post "/signup" do
    if params[:name] == "" || params[:username] == "" || params[:password] ==  ""

     redirect "/signup"
    else
     @user = Owner.create(:name => params[:name], :username => params[:username], :password => params[:password])
     @user.save

     session[:user_id] = @user.id

     redirect "/teams"
    end
  end

  get "/login" do
    if !logged_in?
      erb :"/owners/login.html"
    else
      redirect "/teams"
    end
  end


  post "/login" do
    @user = Owner.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:owner_id] = @user.id
      redirect "/teams"
    else
      redirect "/signup"
    end
  end

end
