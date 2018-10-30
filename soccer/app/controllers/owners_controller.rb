class OwnersController < ApplicationController

  # GET: /owners
  get "/owners" do
    erb :"/owners/index.html"
  end

  # GET: /owners/new
  get "/owners/new" do
    erb :"/owners/new.html"
  end

  # POST: /owners
  post "/owners" do
    redirect "/owners"
  end

  # GET: /owners/5
  get "/owners/:id" do
    erb :"/owners/show.html"
  end

  # GET: /owners/5/edit
  get "/owners/:id/edit" do
    erb :"/owners/edit.html"
  end

  # PATCH: /owners/5
  patch "/owners/:id" do
    redirect "/owners/:id"
  end

  # DELETE: /owners/5/delete
  delete "/owners/:id/delete" do
    redirect "/owners"
  end
end
