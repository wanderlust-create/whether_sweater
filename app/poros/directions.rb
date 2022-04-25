class Directions
  attr_reader :travel_time

  def initialize(data)
    require "pry"; binding.pry
    @travel_time = data[:route][:formattedTime]
  end
end
