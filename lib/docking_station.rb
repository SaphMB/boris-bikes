# require 'bike'

class DockingStation

	DEFAULT_CAPACITY = 20

	attr_accessor :bikes, :bike, :capacity

	def initialize
		@bikes = []
		@capacity = DEFAULT_CAPACITY
	end


  def release_bike
		raise "No working bikes available" if @bikes.empty?
		@bikes.select {|bike| bike.working? }.pop
  end

	def dock(bike)
		raise "Station is full, no bikes can be docked" if full?
		@bike = bikes
		@bikes << bike
	end

	private

	def full?
		@bikes.count == @capacity
	end

	def empty?
		@bikes.count == 0
	end

end
