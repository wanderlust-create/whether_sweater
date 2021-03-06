# frozen_string_literal: true

class RestaurantFacade
  def self.restaurant(category, location)
    restaurant_details = YelpSearchService.get_restaurant(category, location)
    Restaurant.new(restaurant_details)
  end
end
