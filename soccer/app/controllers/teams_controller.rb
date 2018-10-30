class TeamsController < ApplicationController

  # GET: /teams
  get "/teams" do
    erb :"/teams/index.html"
  end

  # GET: /teams/new
  get "/teams/new" do
    erb :"/teams/new.html"
  end

  # POST: /teams
  post "/teams" do
    redirect "/teams"
  end

  # GET: /teams/5
  get "/teams/:id" do
    erb :"/teams/show.html"
  end

  # GET: /teams/5/edit
  get "/teams/:id/edit" do
    erb :"/teams/edit.html"
  end

  # PATCH: /teams/5
  patch "/teams/:id" do
    redirect "/teams/:id"
  end

  # DELETE: /teams/5/delete
  delete "/teams/:id/delete" do
    redirect "/teams"
  end
end
