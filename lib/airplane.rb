require 'pry'

class Airplane

  attr_reader :type, :wing_loading, :horsepower

  def initialize(type, wing_loading, horsepower)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @running = false
    @flying = false
  end

  def start
    if @running == false
      @running = true
      "airplane started"
    else
      "airplane already started"
    end
  end

  def takeoff
    if @running == true
      @flying = true
      "airplane launched"
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
      @flying = false
      "airplane landed"
    end
  end

end
