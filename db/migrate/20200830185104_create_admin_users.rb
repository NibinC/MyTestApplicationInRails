class CreateAdminUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_users do |t|
      t.string "first_name",:limit=>30
      t.string "last_name",:limit=>30
      t.string "email" ,:limit=>40
      t.string "username",:limit=>30
      t.string "password"
      t.timestamps
    end
  end
end
