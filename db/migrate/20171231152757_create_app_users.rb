class CreateAppUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :app_users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :role

      t.timestamps
    end
  end
end
