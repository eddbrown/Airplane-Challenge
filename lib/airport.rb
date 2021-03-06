require_relative 'weather'

class Airport

	DEFAULT_CAPACITY = 6

	include Weather_Generator

	def initialize
		@planes = []
	end

	def land(plane)
		if generate_weather! == "sunny"
			@planes << plane if plane.flying?
			plane.land!
			if full?
				until empty? do 
					@planes.each {|plane| take_off(plane)}
				end
			end
	  else
	  	raise 'it is too stormy to land!'
	  end
	end

	def plane_count
		@planes.count
	end

	def take_off(plane)
		raise 'no planes at airport!' if empty?
		if generate_weather! == "sunny"
			@planes.delete plane
			plane.take_off!
		else
			raise 'it is too stormy to take off!'
		end
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