class Hostname < ApplicationRecord
  has_many :recipes

  # validations
  validates_presence_of :hostname
  validates_uniqueness_of :hostname, case_sensitive: false
end
