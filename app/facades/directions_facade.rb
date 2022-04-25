class DirectionsFacade
  def self.directions(from, to)
    direction_details = MapquestDirectionsService.get_directions(from, to)
    data = Directions.new(direction_details)
  end
end
