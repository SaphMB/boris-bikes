require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "Creates new bike" do
    docking_station = DockingStation.new
    expect(docking_station.release_bike).to be_instance_of Bike
  end

  it "bike is_working?" do
    docking_station = DockingStation.new
    expect(docking_station.release_bike.working?).to eq true
  end



end
