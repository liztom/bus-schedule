require 'spec_helper'

describe Line do
  it { should have_many :stops }
  it { should have_many :stations }
  it { should have_many :buses }
  it { should validate_presence_of :name }

  context "#station_stop" do
    it "gives the stop for a line-station pair" do
      line = Line.create(name: "Red")
      station = Station.create(name: "Downtown")
      stop = Stop.create(line_id: line.id, station_id: station.id)
      stop2 = Stop.create(line_id: line.id, station_id: 1)
      line.station_stop(station).should eq stop
    end
  end
end
