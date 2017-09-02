require 'docking_station'

describe DockingStation do

	subject(:station) { described_class.new }
	let(:bike) { double('bike') }

  it { is_expected.to respond_to :release_bike }

  it "expects a bike to be working" do
		station.dock(bike)
		allow(bike).to receive(:working?).and_return(true)
    expect(station.release_bike.working?).to eq true
  end

	it { is_expected.to respond_to(:dock).with(1).argument }

	it 'can dock bikes' do
		station.dock(bike)
		expect(station.bikes.count).to eq 1
	end

	it 'raises an error when attempting to release bike from empty station' do
		expect{station.release_bike}.to raise_error("No working bikes available")
	end

	it 'raises an error when attempting to dock a bike at a full station' do
		station.capacity.times do
			station.dock(bike)
		end
		expect{station.dock(bike)}.to raise_error("Station is full, no bikes can be docked")
	end

	it 'has a default capacity of 20' do
		expect(station.capacity).to eq 20
	end

	context 'bike is broken' do
		let(:bike) { double('bike', working: false) }
	end

end
