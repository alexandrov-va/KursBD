class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|


      t.datetime :travel_date

      t.belongs_to :employee
      t.belongs_to :route

      #t.timestamps null: false
    end
  end
end
