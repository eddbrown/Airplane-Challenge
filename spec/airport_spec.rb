require 'airport'

describe Airport do

	let(:airport) {Airport.new}
	let(:plane) {double :plane, flying?: true}
	let(:grounded_plane) {double :plane, flying?: false}
	let(:flying_plane) {double :plane, flying?: true}

	it 'should be able to land a flying plane' do
		airport.land(plane)
		expect(airport.plane_count).to eq(1)
	end

	it 'should allow a plane to take off' do
		airport.land(plane)
		expect(airport.plane_count).to eq(1)
		airport.take_off(plane)
		expect(airport.plane_count).to eq(0)
	end

	it 'should have a plane capacity' do
		6.times{airport.land(plane)}
		expect(airport).to be_full
		expect(lambda {airport.land(plane)}).to raise_error(RuntimeError, 'full!')
		expect(airport.plane_count).to eq(6)
	end

	it 'should only accept flying planes' do
		airport.land(grounded_plane)
		expect(airport.plane_count).to eq(0)
		airport.land(flying_plane)
		expect(airport.plane_count).to eq(1)
	end

	it 'should change the state of the plane from flying to not flying when it lands' do
		expect(plane).to be_flying
		airport.land(plane)
		expect(plane).not_to be_flying
	end

end