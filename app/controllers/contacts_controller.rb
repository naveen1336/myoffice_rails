


require 'httparty'
class ContactsController < ApplicationController

  include AuthHelper

  before_action :set_contact, only: [:update,:edit,:move_to_master,:show]



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

        def edit

        end

        def show
        end




        def common_contacts

          # contacts = Contact.where(visibility: 'true')
          @contacts_array = Contact.where(visibility: 'true').where.not(contact_id: ContactRecord.pluck(:contact_id)).where.not(contact_id: ContactRecord.pluck(:master_id)).where.not(contact_id: MasterContact.pluck(:contact_id))
          # @contacts_array = []
          #
          # contacts.each do |contact|
          #   contacts = Contact.search_by_title(contact.contact_email).where.not(contact_id: ContactRecord.pluck(:contact_id)).where.not(contact_id: ContactRecord.pluck(:master_id))
          #   @contacts_array << contacts
          # end
          # @contacts_array = @contacts_array.to_a
          # # byebug

        end


        def update

          respond_to do |format|

            token = get_access_token
            email = session[:user_email]
            if token
              # If a token is present in the session, get contacts
              # api_token= token
              data = {
                "postalAddresses": [{
                  "type": "business",
                  "postOfficeBox": "P.O. Box 100",
                  "street": "123 Some street",
                  "city": "Seattle",
                  "state": "WA",
                  "countryOrRegion": "USA",
                  "postalCode": "98121"
                  }],
                  "birthday": "1974-07-22"
                }

                endpoint = "https://graph.microsoft.com/beta/me/contacts/#{@contact.contact_id}"


                response = HTTParty.patch(endpoint,
                  :body => data.to_json,
                  :headers => { "Content-Type" => 'application/json', "Authorization" => "Bearer #{token}"})

                end


                if @contact.update_attributes(visibility: params[:visibility])
                  format.html { redirect_to contacts_path, notice: 'App user was successfully updated.' }
                  format.json { render status: :ok, location: @contact }
                else
                  format.html { render :edit }
                  format.json { render json: @contact.errors, status: :unprocessable_entity }
                end
              end
            end


            def mastercontacts
              @contacts = MasterContact.all

            end

            def master_update
              #  byebug

              contact_list = params[:contact_ids].split(",").map(&:to_i)
              master_list = params[:master_ids].first.to_i
              # byebug
              contact_list = contact_list - [master_list]
              contact_list.each do |contact|
                ContactRecord.create(contact_id: Contact.find(contact).contact_id,master_id: Contact.find(master_list).contact_id )
              end
              master_contact_id = Contact.find(master_list).contact_id

              MasterContact.create(Contact.find_by(contact_id: master_contact_id).as_json(:except => :id))
              render status: :ok





            end

            def move_to_master
            if   MasterContact.create(@contact.as_json(:except => :id))
              redirect_to commondata_path

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
