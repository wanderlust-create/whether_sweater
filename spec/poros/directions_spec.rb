require 'rails_helper'
RSpec.describe Directions do
  it 'exists with attributes' do
    directions_data = {
      "route": {
        "hasTollRoad": false,
        "hasBridge": true,
        "boundingBox": {
          "lr": {
            "lng": -81.090103,
            "lat": 32.074329
          },
          "ul": {
            "lng": -84.403755,
            "lat": 33.748547
          }
        },
        "distance": 248.187,
        "hasTimedRestriction": false,
        "hasTunnel": false,
        "hasHighway": true,
        "computedWaypoints": [],
        "routeError": {
          "errorCode": -400,
          "message": ""
        },
        "formattedTime": "03:42:32",
        "sessionId": "6266bd8d-028a-6750-02b4-34c6-1237e9ae5209",
        "hasAccessRestriction": false,
        "realTime": 13732,
        "hasSeasonalClosure": false,
        "hasCountryCross": false,
        "fuelUsed": 12.13
        }}
        route = Route.new(route_data)
        expect(route).to be_a Route
        expect(route.time).to eq("03:42:32")
      end
    end
