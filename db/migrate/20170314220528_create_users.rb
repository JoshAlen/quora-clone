class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :firstname
			t.string :lastname
			t.string :email, uniqueness: true
			t.string :password_digest, null: false

			t.timestamps
		end
	end
end
