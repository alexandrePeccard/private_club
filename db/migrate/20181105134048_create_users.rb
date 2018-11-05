class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :first_name, optional: false
    	t.string :last_name, optional: false
    	t.string :email, optional: false
    end
  end
end
