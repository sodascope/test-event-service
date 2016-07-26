require 'spec_helper'

describe ServiceController do

  before :each do
    @event1 = FactoryGirl.create(:event1)
    @event2 = FactoryGirl.create(:event1)
    @event3 = FactoryGirl.create(:eventSameOrg)
    @event4 = FactoryGirl.create(:eventSameOrg)
  end

  context "GET to index" do
    it "expect return ok" do
      get :index, :format => "json"
      expect( response ).to be_success
      events_json = JSON.parse(response.body)
      expect( events_json["status"] ).to eql("ok")
    end
  end

  context "GET to events" do
    it "expect return all events" do
      get :events, :format => "json"
      expect( response ).to be_success
      events_json = JSON.parse(response.body)
      expect( events_json.count ).to be 4
      expect( events_json[0]["org"] ).to eql(@event1.org)
    end

    it "expect return events from 'SameOrg'" do
      get :events, params: { org: @event3.org }, :format => "json"
      expect( response ).to be_success
      events_json = JSON.parse(response.body)
      expect( events_json.count ).to be 2
      expect( events_json[0]["org"] ).to eql("SameOrg")
      expect( events_json[1]["org"] ).to eql("SameOrg")
    end

  end

end
