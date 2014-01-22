class Group < ActiveRecord::Base
  attr_accessible :deccription, :title
  validates :title, :presence => true
end
