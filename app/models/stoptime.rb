class Stoptime < ActiveRecord::Base

  belongs_to :stop
  belongs_to :bus
  validates :name, presence: true

end
