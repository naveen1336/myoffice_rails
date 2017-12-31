class ContactsController < ApplicationController
include AuthHelper

before_action :set_contact, only: [:update]
  def index
    token = get_access_token
    email = session[:user_email]
    if token
      # If a token is present in the session, get contacts
      callback = Proc.new do |r| 
        r.headers['Authorization'] = "Bearer #{token}"
        r.headers['X-AnchorMailbox'] = email
      end

      graph = MicrosoftGraph.new(base_url: 'https://graph.microsoft.com/v1.0',
                                cached_metadata_file: File.join(MicrosoftGraph::CACHED_METADATA_DIRECTORY, 'metadata_v1.0.xml'),
                                &callback)



      contacts = graph.me.contacts.order_by('givenName asc')
			 contacts.each do |contact|
 	

		if Contact.find_by(contact_id: contact.id).present? 
			if (Contact.find_by(contact_id: contact.id).lastmodifieddatetime < contact.last_modified_date_time)

		
			  Contact.find_by(contact_id: contact.id).update_attributes(
					 contact_email: contact.email_addresses[0] ? contact.email_addresses[0].address : 'NONE',
					 contact_firstname: contact.given_name,
				     contact_lastname: contact.surname,
				     birthday: contact.birthday,
				     displayname: contact.display_name,
				     initials: contact.initials,
				     middlename: contact.middle_name,
				     nickname: contact.nick_name,
					 title: contact.title,
				     generation: contact.generation,
					 companyname: contact.company_name,
					 department:  contact.department,
					 officelocation: contact.office_location,
					 profession: contact.profession,
					 businesshomepage: contact.business_home_page,
					 assistantname: contact.assistant_name,
					 manager: contact.manager,
					 homephones: contact.home_phones,
					 mobilephone: contact.mobile_phone,
					 businessphones: contact.business_phones,
					 homeaddress: contact.home_address,
					 businessaddress: contact.business_address,
					 otheraddress: contact.other_address,
					 lastmodifieddatetime: contact.last_modified_date_time )
			end
			
		else


			contact = Contact.create(
					 contact_email: contact.email_addresses[0] ? contact.email_addresses[0].address : 'NONE',
					 contact_firstname: contact.given_name,
				     contact_lastname: contact.surname,
				     birthday: contact.birthday,
				     displayname: contact.display_name,
				     initials: contact.initials,
				     middlename: contact.middle_name,
				     nickname: contact.nick_name,
					 title: contact.title,
				     generation: contact.generation,
					 companyname: contact.company_name,
					 department:  contact.department,
					 officelocation: contact.office_location,
					 profession: contact.profession,
					 businesshomepage: contact.business_home_page,
					 assistantname: contact.assistant_name,
					 manager: contact.manager,
					 homephones: contact.home_phones,
					 mobilephone: contact.mobile_phone,
					 businessphones: contact.business_phones,
					 homeaddress: contact.home_address,
					 businessaddress: contact.business_address,
					 otheraddress: contact.other_address,
					 lastmodifieddatetime: contact.last_modified_date_time,
					 contact_id: contact.id )
		end

		end

		@contacts = Contact.order(contact_email: :desc)
    else
      # If no token, redirect to the root url so user
      # can sign in.
      redirect_to root_url
    end
  end



  def common_contacts

  	contacts = Contact.all
  	@contacts_array = [] 

  	contacts.each do |contact|
  	contacts = Contact.search_by_title(contact.contact_email)
  	@contacts_array << contacts
  	end
  	@contacts_array = @contacts_array.to_a.uniq
  	# byebug

  end


    def update
    respond_to do |format|
      if @contact.update_attributes(visibility: params[:visibility])
        format.html { redirect_to @contact, notice: 'App user was successfully updated.' }
        format.json { render status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end


  private

 def set_contact
      @contact = Contact.find(params[:id])
    end
 

  def contact_params
  params.permit(:visibility)

  end


end
