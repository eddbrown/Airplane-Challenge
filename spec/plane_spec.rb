require 'plane'
 
describe Plane do
	
	let(:plane) {Plane.new}
	it 'should be flying when we create it' do
		expect(plane).to be_flying
	end

end