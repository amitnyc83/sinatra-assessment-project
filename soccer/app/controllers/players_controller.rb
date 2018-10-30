class PlayersController < ApplicationController

  # GET: /players
  get "/players" do
    erb :"/players/index.html"
  end

  # GET: /players/new
  get "/players/new" do
    erb :"/players/new.html"
  end

  # POST: /players
  post "/players" do
    redirect "/players"
  end

  # GET: /players/5
  get "/players/:id" do
    erb :"/players/show.html"
  end

  # GET: /players/5/edit
  get "/players/:id/edit" do
    erb :"/players/edit.html"
  end

  # PATCH: /players/5
  patch "/players/:id" do
    redirect "/players/:id"
  end

  # DELETE: /players/5/delete
  delete "/players/:id/delete" do
    redirect "/players"
  end
end
