class Project < ActiveRecord::Base
  has_many :skills

  validates :name, :description, :presence => true
end
