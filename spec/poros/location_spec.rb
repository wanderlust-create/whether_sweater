require 'rails_helper'
RSpec.describe Location do
  it 'exists with attributes' do

    location_data = {
      "street": "",
      "adminArea6": "",
      "adminArea6Type": "Neighborhood",
      "adminArea5": "Woodstock",
      "adminArea5Type": "City",
      "adminArea4": "Cherokee County",
      "adminArea4Type": "County",
      "adminArea3": "GA",
      "adminArea3Type": "State",
      "adminArea1": "US",
      "adminArea1Type": "Country",
      "postalCode": "30188",
      "geocodeQualityCode": "Z1XAA",
      "geocodeQuality": "ZIP",
      "dragPoint": false,
      "sideOfStreet": "N",
      "linkId": "286279792",
      "unknownInput": "",
      "type": "s",
      "latLng": {
        "lat": 34.112675,
        "lng": -84.464391
      },
      "displayLatLng": {
        "lat": 34.112675,
        "lng": -84.464391
      },
      "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=3rT6jNncTD2eAWQBUkfuNti1A29oA0Az&type=map&size=225,160&locations=34.112675,-84.464391|marker-sm-50318A-1&scalebar=true&zoom=15&rand=-334833918"
    }
      location = Location.new(location_data)
      expect(location).to be_a Location
      expect(location.city).to eq("Woodstock")
      expect(location.state).to eq("GA")
      expect(location.country).to eq("US")
      expect(location.latitude).to eq(34.112675)
      expect(location.longitude).to eq(-84.464391)
  end
end
