class TeamsController < ApplicationController

  # GET: /teams
  get "/teams" do
    if logged_in?
      @teams = Team.all


      erb :"/teams/index.html"
    else
     redirect "/login"
    end
  end

  post "/teams" do
    if logged_in?
      if params[:name] == ""

        redirect "/teams/new"
      else
        @team = Team.create(name: params[:name])
        current_user.teams << @team
        @team.save

        redirect "/teams/#{@team.id}"
      end
    else
      redirect "/login"
    end
  end


  get "/teams/new" do
    if logged_in?
      erb :"/teams/new.html"
    else
      redirect "/login"
    end
  end

  get "/teams/:id" do
    if logged_in?
      @team = Team.find_by_id(params[:id])

      erb :"/teams/show.html"
    else
      redirect "/login"
    end
  end

  get "/teams/:id/edit" do
    if logged_in?
      @team = Team.find_by_id(params[:id])

      erb :"/teams/edit.html"
    else
      redirect "/login"
    end
  end


  patch "/teams/:id" do
    if logged_in?
      if params[:name] == ""

        redirect "/teams/#{params[:id]}/edit"
      else
        @team = Team.find_by_id(params[:id])
        @team.update(name: params[:name])

        redirect "/teams/#{@team.id}"
      end
    else
      redirect "/login"
    end
  end


  delete "/teams/:id/delete" do
    if logged_in?
      @team = Team.find_by_id(params[:id])
      if @team && @team.user == current_user
        @team.delete

        redirect "/teams"
      else
        redirect "/login"
      end
    end
  end




end
