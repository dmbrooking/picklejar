class Recipe < ApplicationRecord
  validates_presence_of :url
  validates_uniqueness_of :url, case_sensitive: false

  has_many :user_recipes, dependent: :destroy
  has_many :users, through: :user_recipes

  belongs_to :hostname

end
