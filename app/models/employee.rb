class Employee < ActiveRecord::Base
  has_one :group
end
