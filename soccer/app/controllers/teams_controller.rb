class TeamsController < ApplicationController

  # GET: /teams
  get "/teams" do
    if logged_in?
      @teams = Team.all
      erb :"/teams/index.html"
    else
     redirect to "/login"
    end
  end



  get "/teams/new" do
    if logged_in?
      erb :"/teams/new.html"
    else
      redirect to "/login"
    end
  end

  post "/teams" do
    if logged_in?
      team = Team.create(:name => params[:name], :stadium => params[:stadium], :sponsor => params[:sponsor])
      current_user.teams << team
      team.save

      redirect to "/teams/#{team.id}"
    else
      if params[:name] == "" || params[:stadium] == "" || params[:sponsor] == ""

        redirect to "/teams/new"
      else
        redirect to "/login"
      end
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
      if current_user == @team.user

      erb :"/teams/edit.html"
    else
      redirect to "/teams"
    end
  end


  patch "/teams/:id" do
    if logged_in?
      team = Team.find_by_id(params[:id])
      team.update(name: params[:name], stadium: params[:stadium], sponsor: params[:sponsor])

      redirect to "/teams/#{team.id}"
    else
      if params[:name] == "" || params[:stadium] == "" || params[:sponsor] == ""

        redirect "/teams/#{params[:id]}/edit"
      else
        redirect "/login"
      end
    end
  end


  delete "/teams/:id/delete" do
    if logged_in?
      team = Team.find_by_id(params[:id])
      if team && @team.user == current_user
        @team.delete

        redirect "/teams"
      else
        redirect "/login"
      end
    end
  end




end
