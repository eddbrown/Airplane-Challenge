require 'weather'

class Weather
	include Weather_Generator
end


describe Weather do 

	let(:weather) {Weather.new}


	it 'should generate a number!' do
		weather.generate_number!
		expect(weather.generate_number!).to be_kind_of(Fixnum)
	end

	it 'should generate a weather condition' do
		expect(weather.generate_weather!).to be_kind_of(String)
	end

end
