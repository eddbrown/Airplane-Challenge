require 'airport'

describe Airport do

	let(:airport) {Airport.new}
	let(:plane) {double :plane, flying?: true, land!: nil, fly!: nil}
	let(:grounded_plane) {double :plane, flying?: false}
	let(:flying_plane) {double :plane, flying?: true}

	it 'should be able to land a flying plane' do
		expect(plane).to receive(:land!)
		airport.land(plane)
		expect(airport.plane_count).to eq(1)
	end

	it 'should allow a plane to take off' do
		airport.land(plane)
		expect(airport.plane_count).to eq(1)
		expect(plane).to receive(:take_off!)
		airport.take_off(plane)
		expect(airport.plane_count).to eq(0)
	end

	it 'should only accept flying planes' do
		expect(grounded_plane).to receive(:land!)
		expect(flying_plane).to receive(:land!)
		airport.land(grounded_plane)
		expect(airport.plane_count).to eq(0)
		airport.land(flying_plane)
		expect(airport.plane_count).to eq(1)
	end

	it 'should tell the plane to land when landing the plane' do
		expect(plane).to receive(:land!)
		airport.land(plane)
	end

	it 'should not take_off a plane if empty' do
		expect(lambda{airport.take_off(plane)}).to raise_error(RuntimeError, 'no planes at airport!')
	end

	it 'should tell all planes to take_off if full' do
		expect(plane).to receive(:take_off!)
		6.times{airport.land(plane)}
		expect(airport).to be_empty
	end
end