
require_relative "../../lib/airplane"

describe Airplane do

  let(:my_plane) {Airplane.new("cesna", 10, 150)}
  let(:my_low_fuel_plane) {Airplane.new("cesna", 10, 150, 10)}

  describe 'airplane attribute checks' do
    it 'type cesna works correctly' do
      my_plane = Airplane.new("cesna", 10, 150)
      expect(my_plane.type).to eq("cesna")
    end
    it 'wing_loading ikarus works correctly' do
      my_plane = Airplane.new("ikarus", 7.8, 100)
      expect(my_plane.wing_loading).to eq(7.8)
    end
    it 'horsepower van works correctly' do
      my_plane = Airplane.new("van", 14, 180)
      expect(my_plane.horsepower).to eq(180)
    end
  end

  describe "#initialization" do
    # implicitly tested initialization, otherwise
    # the above attribute checks would not work
  end

  describe "#start" do
    it 'plane is starting correctly' do
      expect(my_plane.start).to eq("airplane started")
    end
    it 'plane recognizes that it\'s running already' do
      my_plane.start
      expect(my_plane.start).to eq("airplane already started")
    end

    it 'plane is starting with low fuel' do
      my_plane.fuel = 0
      expect(my_plane.start).to eq("airplane has no fuel")
    end
    
    it 'plane is starting with negative fuel' do
      my_plane.fuel = -200
      expect(my_plane.start).to eq("airplane has no fuel")
    end

  end

  describe "#takeoff" do
    it 'attempt takeoff when plane is started' do
      my_plane.start
      expect(my_plane.takeoff).to eq("airplane launched")
    end
    it 'attempt takeoff when plane is not yet started' do
      expect(my_plane.takeoff).to eq("airplane not started, please start")
    end

    it 'plane is taking off with low fuel' do
      my_low_fuel_plane.start
      # puts "fuel:  #{my_low_fuel_plane.fuel}"
      expect(my_low_fuel_plane.takeoff).to eq("airplane has no fuel")
    end
    
    it 'plane is taking off with negative fuel' do
      my_plane.start
      my_plane.fuel = -200
      expect(my_plane.takeoff).to eq("airplane has no fuel")
    end

  end

  describe "#land" do
    it 'attempt landing when not started' do
      expect(my_plane.land).to eq("airplane not started, please start")
    end
    it 'attempt landing when plane is started, not flying' do
      my_plane.start
      expect(my_plane.land).to eq("airplane already on the ground")
    end
    it 'attempt landing when started and flying' do
      my_plane.start
      my_plane.takeoff
      expect(my_plane.land).to eq("airplane landed")
    end

    it 'plane is taking off with low fuel' do
      my_low_fuel_plane.start
      # puts "fuel:  #{my_low_fuel_plane.fuel}"
      expect(my_low_fuel_plane.takeoff).to eq("airplane has no fuel")
    end
    
    it 'plane is taking off with negative fuel' do
      my_plane.start
      my_plane.fuel = -200
      expect(my_plane.takeoff).to eq("airplane has no fuel")
    end

  end

end
