require "spec_helper"

describe CelebritiesController do
  describe "routing" do

    it "routes to #index" do
      get("/celebrities").should route_to("celebrities#index")
    end

    it "routes to #new" do
      get("/celebrities/new").should route_to("celebrities#new")
    end

    it "routes to #show" do
      get("/celebrities/1").should route_to("celebrities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/celebrities/1/edit").should route_to("celebrities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/celebrities").should route_to("celebrities#create")
    end

    it "routes to #update" do
      put("/celebrities/1").should route_to("celebrities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/celebrities/1").should route_to("celebrities#destroy", :id => "1")
    end

  end
end
