require 'spec_helper'

describe Stop do
  it { should belong_to :station }
  it { should belong_to :line }
  it { should have_many :stoptimes }
end
