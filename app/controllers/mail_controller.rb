class MailController < ApplicationController
layout "fetch_layout"
  include AuthHelper

  # after_action :find_email

  def index
    token = get_access_token
    email = session[:user_email]


    if token
      # If a token is present in the session, get messages from the inbox
      callback = Proc.new do |r|
        r.headers['Authorization'] = "Bearer #{token}"
        r.headers['X-AnchorMailbox'] = email
      end

      graph = MicrosoftGraph.new(base_url: 'https://graph.microsoft.com/v1.0',
                                 cached_metadata_file: File.join(MicrosoftGraph::CACHED_METADATA_DIRECTORY, 'metadata_v1.0.xml'),
                                 &callback)

      @messages = graph.me.mail_folders.find('inbox').messages.order_by('receivedDateTime desc')

      puts session[:user_email]
    else
      # If no token, redirect to the root url so user
      # can sign in.
      redirect_to root_url
    end
  end

  private


def find_email
# get_user_email
print "this is email add #{session[:user_email]}"
end


end
