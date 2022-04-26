# frozen_string_literal: true

class UnsplashBackgroundPhoto
  attr_reader :id, :url, :artist, :portfolio

  def initialize(data)
    @id = data[:results][0][:id]
    @url = data[:results][0][:urls][:full]
    @artist = data[:results][0][:user][:name]
    @portfolio = data[:results][0][:user][:links][:portfolio]
  end
end
