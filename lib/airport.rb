class Airport

	DEFAULT_CAPACITY = 6

	def initialize
		@planes = []
	end

	def land(plane)
		raise 'full!' if full?
		@planes << plane if plane.flying?
		@flying = false
	end

	def plane_count
		@planes.count
	end

	def take_off(plane)
		@planes.delete plane
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def full?
		plane_count == capacity
	end


end