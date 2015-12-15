class CreateDesiredRoutes < ActiveRecord::Migration
  def change
    create_table :desired_routes do |t|

      t.belongs_to :client
      t.belongs_to :route

      #t.timestamps null: false
    end
  end
end
