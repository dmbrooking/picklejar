class Hostname < ActiveRecord::Base
  has_many :recipes

  # validations
  validates_presence_of :hostname
  validates_uniqueness_of :hostname, case_sensitive: false

  has_many :recipes
end
