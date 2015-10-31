class Group < ActiveRecord::Base
  has_many :clients

  belongs_to :route
end
