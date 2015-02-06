require 'airport'

describe Airport do

	let(:airport) {Airport.new}
	let(:plane) {double :plane, flying?: true, land!: nil, take_off!: nil}
	let(:grounded_plane) {double :plane, flying?: false}
	let(:flying_plane) {double :plane, flying?: true}

	it 'should be able to land a flying plane' do
		Airport.any_instance.stub(:generate_weather!).and_return("sunny")
		expect(plane).to receive(:land!)
		airport.land(plane)
		expect(airport.plane_count).to eq(1)
	end

	it 'should only accept flying planes' do
		Airport.any_instance.stub(:generate_weather!).and_return("sunny")
		expect(grounded_plane).to receive(:land!)
		expect(flying_plane).to receive(:land!)
		airport.land(grounded_plane)
		expect(airport.plane_count).to eq(0)
		airport.land(flying_plane)
		expect(airport.plane_count).to eq(1)
	end

	it 'should tell the plane to land' do
		Airport.any_instance.stub(:generate_weather!).and_return("sunny")
		expect(plane).to receive(:land!)
		airport.land(plane)
		expect(airport.plane_count).to eq(1)
	end

	it 'should not take_off a plane if empty' do
		expect(lambda{airport.take_off(plane)}).to raise_error(RuntimeError, 'no planes at airport!')
	end

	it 'should tell all planes to take_off if full' do
		Airport.any_instance.stub(:generate_weather!).and_return("sunny")
		6.times{airport.land(plane)}
		expect(airport).to be_empty
	end

	it 'should allow a plane to land only if the weather is sunny' do
		Airport.any_instance.stub(:generate_weather!).and_return("sunny")
		airport.land(plane)
		airport.take_off(plane)
		Airport.any_instance.stub(:generate_weather!).and_return("stormy")
		expect( lambda{airport.land(plane)}).to raise_error(RuntimeError, 'it is too stormy to land!')
	end

	it 'should allow a plane to take off only if the weather is sunny' do
		Airport.any_instance.stub(:generate_weather!).and_return("sunny")
		airport.land(plane)
		Airport.any_instance.stub(:generate_weather!).and_return("stormy")
		expect( lambda{airport.take_off(plane)}).to raise_error(RuntimeError, 'it is too stormy to take off!')
	end


end