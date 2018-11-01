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

end
