class DirectionsFacade
  def self.directions(start, to)
    direction_details = MapquestDirectionsService.get_directions(start, to)
    data = Directions.new(direction_details)
  end
end
