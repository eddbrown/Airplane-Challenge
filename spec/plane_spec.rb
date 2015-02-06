require 'plane'
 
describe Plane do
	
	let(:plane) {Plane.new}
	it 'should be flying when we create it' do
		expect(plane).to be_flying
	end

	it 'should land if we tell it to' do
		plane.land!
		expect(plane).not_to be_flying
	end

	it 'should take_off if we tell it to' do
		plane.land!
		expect(plane).not_to be_flying
		plane.take_off!
		expect(plane).to be_flying
	end

end