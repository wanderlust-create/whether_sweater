class BackgroundPhotoFacade
  def self.photo(location)
    photo_details = UnsplashPhotoService.get_background_photo(location)[:results][0][:urls]
    data = UnsplashBackgroundPhoto.new(photo_details)
  end
end
