class Airport

	DEFAULT_CAPACITY = 6

	def initialize
		@planes = []
	end

	def land(plane)
		@planes << plane if plane.flying?
		plane.land!
		@planes.each {|plane| take_off(plane)} if full?
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