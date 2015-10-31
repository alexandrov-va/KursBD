class Client < ActiveRecord::Base
  belongs_to :group

  has_many :desired_routes
  has_many :routes, through: :desired_routes
end
