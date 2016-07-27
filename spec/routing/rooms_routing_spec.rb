require "rails_helper"

RSpec.describe RoomsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/organizations/2/rooms").to route_to("rooms#index", :organization_id => '2')
    end

    it "routes to #new" do
      expect(:get => "/organizations/2/rooms/new").to route_to("rooms#new", :organization_id => '2')
    end

    it "routes to #show" do
      expect(:get => "/organizations/2/rooms/1").to route_to("rooms#show", :organization_id => '2', :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/organizations/2/rooms/1/edit").to route_to("rooms#edit", :organization_id => '2', :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/organizations/2/rooms").to route_to("rooms#create", :organization_id => '2')
    end

    it "routes to #update via PUT" do
      expect(:put => "/organizations/2/rooms/1").to route_to("rooms#update", :organization_id => '2', :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/organizations/2/rooms/1").to route_to("rooms#update", :organization_id => '2', :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/organizations/2/rooms/1").to route_to("rooms#destroy", :organization_id => '2', :id => "1")
    end

  end
end
