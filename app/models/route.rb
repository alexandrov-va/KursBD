class Route < ActiveRecord::Base
  has_many :desired_routes
  has_many :routes, through: :desired_routes

  has_many :groups
end
