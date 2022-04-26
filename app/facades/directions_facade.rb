# frozen_string_literal: true

class DirectionsFacade
  def self.directions(start, destination)
    direction_details = MapquestDirectionsService.get_directions(start, destination)
    data = Directions.new(direction_details)
  end
end
