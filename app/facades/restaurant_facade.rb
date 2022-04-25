class RestaurantFacade
  def self.restaurant(category, location)
    restaurant_details = YelpSearchService.get_restaurant(category, location)
    data = Restaurant.new(restaurant_details)
  end
end
