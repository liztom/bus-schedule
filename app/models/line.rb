class Line < ActiveRecord::Base
  has_many :stops
  has_many :stations, through: :stops
  has_many :stoptimes, through: :stops
  validates :name, :presence => true

  def station_stop(station)
    Stop.find_by(station_id: station.id, line_id: self.id)
  end
end
