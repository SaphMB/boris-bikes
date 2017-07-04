require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
end

describe DockingStation do
  it "Creates new bike" do
    docking_station = DockingStation.new
    expect(docking_station.release_bike).to eq(Bike.new)
  end
end
