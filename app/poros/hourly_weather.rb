# frozen_string_literal: true

class HourlyWeather
  attr_reader :time, :temperature, :conditions, :icon

  def initialize(data)
    @time = Time.zone.at(data[:dt]).to_s
    @temperature = data[:temp]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
