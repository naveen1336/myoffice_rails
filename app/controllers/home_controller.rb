class HomeController < ApplicationController
layout "fetch_layout"
 include AuthHelper



def index
    # Display the login link.
    @login_url = get_login_url
end



end
