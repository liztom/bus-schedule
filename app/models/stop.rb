class Stop < ActiveRecord::Base
  belongs_to :line
  belongs_to :station
  validates :stoptime, :presence => true
end
