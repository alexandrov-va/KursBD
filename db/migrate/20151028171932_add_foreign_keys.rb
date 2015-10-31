class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :clients, :groups
    add_foreign_key :groups, :routes
    add_foreign_key :desired_routes, :clients
    add_foreign_key :desired_routes, :routes
  end
end
