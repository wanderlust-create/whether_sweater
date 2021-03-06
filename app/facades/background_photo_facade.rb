# frozen_string_literal: true

class BackgroundPhotoFacade
  def self.photo(location)
    photo_details = UnsplashPhotoService.get_background_photo(location)
    UnsplashBackgroundPhoto.new(photo_details)
  end
end
