class UnsplashBackgroundPhoto
  attr_reader :url

  def initialize(data)
    @url = data[:full]
  end
end
