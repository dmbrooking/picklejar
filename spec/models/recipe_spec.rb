require "rails_helper"

describe Recipe, :type => :model do
  before { @recipe = FactoryGirl.build(:recipe) }
  subject { @recipe }

  it { should be_valid }

  it { should validate_presence_of(:url) }
  it { should validate_uniqueness_of(:url).case_insensitive }

  it { should respond_to(:title) }
  it { should respond_to(:url) }
  it { should respond_to(:hostname) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }

  # it { should have_many(:users).through(:user_recipes) }
  it { should belong_to(:hostname) }

end
