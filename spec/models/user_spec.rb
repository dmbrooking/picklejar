require 'rails_helper'

describe User, :type => :model do

  it { should have_many(:recipes).through(:user_recipes) }

end
