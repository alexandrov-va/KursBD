class Group < ActiveRecord::Base
  has_many :clients

  belongs_to :route
  belongs_to :employee
end
