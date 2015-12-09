class Route < ActiveRecord::Base
  has_many :desired_routes
  has_many :clients, through: :desired_routes

  has_many :groups
end
