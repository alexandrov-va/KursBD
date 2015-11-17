class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|


      t.string :country
      t.integer :duration
      t.integer :cost


      #t.timestamps null: false
    end
  end
end
