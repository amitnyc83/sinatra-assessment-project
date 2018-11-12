class TeamsController < ApplicationController


  get '/teams' do
     if logged_in?
       erb :'teams/index.html'
     else
       redirect '/login'
     end
   end

   get '/teams/new' do
     if logged_in?
       erb :'/teams/new.html'
     else
       redirect '/login'
     end
   end

   post '/teams' do
     @team = Team.create(params[:team])
     @team.user_id = current_user.id
     @team.save
     redirect '/teams'
   end

   get '/teams/:id' do
     if logged_in?
       @team = Team.find(params[:id])
       @user = current_user
       erb :'teams/show.html'
     else
       redirect '/login'
     end
   end

   post "/teams/:id" do
     if params[:name] == "" || params[:stadium] == "" || params[:sponsor] == ""

      redirect to "/teams/#{@team.id}/edit"
    else
      @team = Team.find_by_id(params[:id])
      if @team && @team.user == current_user
       @team.update(params[:team])
        @team.save
      redirect to "/teams/#{@team.id}"
    else
      redirect to "/users/#{@team.id}/edit"
    end
  end
 end

   get '/teams/:id/edit' do
     @team = Team.find(params[:id])
     if current_user.id == @team.user_id
       erb :'teams/edit.html'
     else
       redirect '/teams'
     end
   end

   patch '/teams/:id' do
     @team = Team.find(params[:id])
     if @team.user_id == current_user.id
       @team.update(params[:team])
       @team.save
       redirect "/teams/#{@team.id}"
     else
       redirect '/teams'
     end
   end




   delete '/teams/:id/delete' do
     @team = Team.find(params[:id])
     if @team.user_id == current_user.id
       @team.delete
       redirect '/teams'
     else
       redirect '/teams'
     end
   end

   post '/teams/:id/delete' do
    @team = Team.find_by_id(params[:id])
    if current_user.teams.include?(@team)
       @team.delete
      redirect to "/teams"
    else
      redirect to '/teams'
    end
  end

end
