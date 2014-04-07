require 'spec_helper'

describe Bus do
  it { should belong_to :line }
  it { should have_many :stoptimes }
  it { should validate_presence_of :name }
end
