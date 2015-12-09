class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|


      t.string :lastname
      t.string :firstname
      t.string :patronymic

      #t.timestamps null: false
    end
  end
end
