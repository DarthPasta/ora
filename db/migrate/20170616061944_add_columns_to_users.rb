class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :location, :string
  	add_column :users, :token, :integer
  	add_column :users, :city, :string 
  	add_column :users, :state, :string
  	add_column :users, :country, :string 
  	add_column :users, :username, :string 
  	add_column :users, :first_name, :string 
  	add_column :users, :last_name, :string 
  	add_column :users, :gender, :string
  	add_column :users, :birthday, :date
  end
end
