require 'pry'

class Airplane

  attr_reader :type, :wing_loading, :horsepower
  attr_accessor :fuel

  def initialize(type, wing_loading, horsepower, fuel=40)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @fuel = fuel
    @running = false
    @flying = false
  end

  def start
    if @running == false
      if @fuel <= 0
        @running = false
        "airplane has no fuel"
      else 
        @running = true
        @fuel -= 10         # consume fuel
        "airplane started"
      end
    else
      "airplane already started"
    end
  end

  def takeoff
    if @running == true
      if @fuel <= 0
        @flying = false
        "airplane has no fuel"
      else
        @flying = true
        @fuel -= 10            # consume fuel
        "airplane launched"
      end
    else
      "airplane not started, please start"
    end
  end

  def land
    if @running == false
      "airplane not started, please start"
    elsif @flying == false
      "airplane already on the ground"
    else
      if @fuel <= 0
        "airplane out of fuel, look for emergency field"
      else
        @flying = false
        @fuel -= 10          #consume fuel
        "airplane landed"
      end
    end
  end

end
