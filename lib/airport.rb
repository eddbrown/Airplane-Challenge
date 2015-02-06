class Airport

	DEFAULT_CAPACITY = 6

	def initialize
		@planes = []
	end

	def land(plane)
		raise 'full!' if full?
		@planes << plane if plane.flying?
		plane.land!
	end

	def plane_count
		@planes.count
	end

	def take_off(plane)
		raise 'no planes at airport!' if empty?
		@planes.delete plane
		plane.take_off!
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def full?
		plane_count == capacity
	end

	def empty?
		plane_count == 0
	end

end