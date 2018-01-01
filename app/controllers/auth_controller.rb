class AuthController < ApplicationController
  include AuthHelper
  def gettoken
    token = get_token_from_code params[:code]

   	# byebug
   if AppUser.find_by(email: get_user_email(token.token)).present?

    session[:azure_token] = token.to_hash
    session[:user_email] = get_user_email token.token
    redirect_to mail_index_url

  	else
  		session[:azure_token] = nil
  		redirect_to root_path
  end
end

end
