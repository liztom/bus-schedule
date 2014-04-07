require 'spec_helper'

describe Stoptime do
  it { should belong_to :stop }
  it { should belong_to :bus }
  it { should validate_presence_of :name }
end
