# frozen_string_literal: true

class DirectionsFacade
  def self.directions(start, destination)
    direction_details = MapquestDirectionsService.get_directions(start, destination)
    if direction_details[:info][:statuscode] == 0
      data = Directions.new(direction_details)
    elsif direction_details[:info][:statuscode] != 0
      return "impossible route"
    else
      return "impossible route"
    end
  end
end
