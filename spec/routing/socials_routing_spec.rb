require "rails_helper"

RSpec.describe SocialsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/socials").to route_to("socials#index")
    end

    it "routes to #new" do
      expect(get: "/socials/new").to route_to("socials#new")
    end

    it "routes to #show" do
      expect(get: "/socials/1").to route_to("socials#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/socials/1/edit").to route_to("socials#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/socials").to route_to("socials#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/socials/1").to route_to("socials#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/socials/1").to route_to("socials#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/socials/1").to route_to("socials#destroy", id: "1")
    end
  end
end
