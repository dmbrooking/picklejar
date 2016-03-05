class Recipe < ApplicationRecord
  validates_presence_of :url
  validates_uniqueness_of :url, case_sensitive: false

  belongs_to :hostname
end
