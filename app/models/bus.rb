class Bus < ActiveRecord::Base
  belongs_to :line
  has_many :stoptimes
  validates :name, presence: true
end
