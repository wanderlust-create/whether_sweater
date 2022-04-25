class Directions
  attr_reader :travel_time

  def initialize(data)
    @time = data[:route][:formattedTime].split(/: */)
  end

  def travel_time
    "#{@time[0].to_i} hours #{@time[1].to_i} min"
  end
end
