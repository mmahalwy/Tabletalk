require "rails_helper"

RSpec.describe ConfirmationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/confirmations").to route_to("confirmations#index")
    end

    it "routes to #new" do
      expect(:get => "/confirmations/new").to route_to("confirmations#new")
    end

    it "routes to #show" do
      expect(:get => "/confirmations/1").to route_to("confirmations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/confirmations/1/edit").to route_to("confirmations#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/confirmations").to route_to("confirmations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/confirmations/1").to route_to("confirmations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/confirmations/1").to route_to("confirmations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/confirmations/1").to route_to("confirmations#destroy", :id => "1")
    end
  end
end
