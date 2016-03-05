require "rails_helper"

describe Hostname, :type => :model do
  before { @hostname = FactoryGirl.build(:hostname) }
  subject { @hostname }

  it { should be_valid }

  it { should validate_presence_of(:hostname) }
  it { should validate_uniqueness_of(:hostname).case_insensitive }

  it { should respond_to(:hostname) }
  it { should respond_to(:description) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }

  #it { should have_many(:recipes) }

end
