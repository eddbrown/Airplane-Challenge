module Weather_Generator

	def generate_number!
		rand(1)
	end

	def generate_weather!
		["sunny","stormy"][rand(1)]
	end


end
