class CreateMasterContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :master_contacts do |t|

    	t.string :contact_firstname
    	t.string :contact_lastname
    	t.string :contact_email
    	t.string :birthday
    	t.string :displayname
    	t.string :initials
    	t.string :middlename
    	t.string :nickname
    	t.string :title
    	t.string :generation
    	t.string :companyname
    	t.string :department
    	t.string :officelocation
    	t.string :profession
    	t.string :businesshomepage
    	t.string :assistantname
    	t.string :manager
    	t.string :homephones
    	t.string :mobilephone
    	t.string :businessphones
    	t.string :homeaddress
    	t.string :businessaddress
    	t.string :otheraddress
    	t.string :outlook_user_id
    	t.string :visibility, default: 'PUBLIC'
    	t.string :lastmodifieddatetime
    	t.string :contact_id


      t.timestamps
    end
  end
end
