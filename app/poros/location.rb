class Location
  attr_reader :city, :state, :country, :latitude, :longitude

  def initialize(data)
    @city = data[:adminArea5]
    @state = data[:adminArea3]
    @country = data[:adminArea1]
    @latitude = data[:displayLatLng][:lat]
    @longitude = data[:displayLatLng][:lng]
  end
end
