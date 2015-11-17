class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|


      t.string :lastname
      t.string :firstname
      t.string :patronymic
      t.integer :passport
      t.string :address
      t.string :phonenumber

      t.belongs_to :group


      #t.timestamps null: false
    end
  end
end
