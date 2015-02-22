class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :surname
    	t.string :email
    	t.text :password_digest
    	t.string :city
    	t.date :birthday
    	t.string :genre
      t.timestamps null: false
    end
  end
end
