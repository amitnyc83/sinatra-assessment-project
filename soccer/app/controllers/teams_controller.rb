require 'pry'

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


  post "/teams" do
    if logged_in?
     if params[:name] == "" || params[:stadium] == "" || params[:sponsor] == ""

      redirect to "/teams/new"
    else
      @team = Team.create(name: params[:name], stadium: params[:stadium], sponsor: params[:sponsor])
       current_user.teams << @team
       current_user.save

       redirect to "/teams/#{@team.id}"
      end
    else
      redirect "/login"
    end
  end


  get "/teams/new" do
    if logged_in?
      erb :"/teams/new.html"
    else
      redirect to "/login"
    end
  end






  get "/teams/:id" do
    if logged_in?
      @team = Team.find_by_id(params[:id])

      erb :"/teams/show.html"
    else
      redirect to "/login"
    end
  end


  post "/teams/:id" do
    if params[:name] == "" || params[:stadium] == "" || params[:sponsor] == ""

     redirect to "/teams/#{@team.id}/edit"
   else
     @team = Team.find_by_id(params[:id])
     if @team && @team.user == current_user
      @team.update(name: params[:name], stadium: params[:stadium], sponsor: params[:sponsor])
       @team.save
     redirect to "/teams/#{@team.id}"
   else
     redirect to "/users/#{@team.id/edit}"
   end
 end
end



  get "/teams/:id/edit" do
    if logged_in?
      @team = Team.find_by_id(params[:id])
      if @team.user_id == current_user.id

        erb :"/teams/edit.html"
      else
        redirect to "/teams"
      end
    else
        redirect to "/login"
    end
  end




  patch "/teams/:id" do
     if params[:name] == "" || params[:stadium] == "" || params[:sponsor] == ""

      redirect to "/teams/#{@team.id}/edit"
    else
      @team = Team.find_by_id(params[:id])
      if @team && @team.user == current_user
       @team.update(name: params[:name], stadium: params[:stadium], sponsor: params[:sponsor])
        @team.save
      redirect to "/teams/#{@team.id}"
    else
      redirect to "/users/#{@team.id/edit}"
    end
  end
end




  delete "/teams/:id/delete" do
    if logged_in?
      @team = Team.find_by_id(params[:id])
      if @team && @team.user_id == current_user
        @team.delete
      end
        redirect to "/teams"
      else
        redirect to "/login"
      end
    end

    post "/teams/:id/delete" do
      if logged_in?
       @team = Team.find_by_id(params[:id])
        if @team && @team.user_id == current_user
          @team.delete
        end
          redirect to "/teams"
        else
          redirect to "/login"
        end
      end




  end
