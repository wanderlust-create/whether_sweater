# frozen_string_literal: true

class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date = Time.at(data[:dt]).to_s
    @sunrise = Time.at(data[:sunrise]).to_s
    @sunset = Time.at(data[:sunset]).to_s
    @max_temp = data[:temp][:max]
    @min_temp = data[:temp][:min]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
