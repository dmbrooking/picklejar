require 'rails_helper'

describe UserRecipe do
  before { @user_recipe = FactoryGirl.create(:user_recipe) }
  subject { @user_recipe }

  it { should be_valid }

  it { should respond_to(:user) }
  it { should respond_to(:recipe) }

  it { should belong_to(:user) }
  it { should belong_to(:recipe) }
end
