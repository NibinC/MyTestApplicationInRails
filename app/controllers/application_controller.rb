class ApplicationController < ActionController::Base
	layout "application"
	
	private

   def confirm_logged_in
    	unless session[:user_id]
      	flash[:notice]="Please Login first"
      	redirect_to(access_login_path)
    	end
   end
end
