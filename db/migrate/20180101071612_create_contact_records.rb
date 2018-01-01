class CreateContactRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_records do |t|

      t.text :contact_id
      t.text :master_id
      t.integer :admin_id

      t.timestamps
    end
  end
end
