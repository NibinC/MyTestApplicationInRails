class AccessController < ApplicationController
  
	before_action :confirm_logged_in, :except=>[:login,:attempt_login,:logout]	
  
  def menu
  
  end

  def login
  end

  def attempt_login
  	if(params[:username].present? && params[:password].present?)
  		found_user = AdminUser.where(:username=>params[:username]).first
  		if found_user
  			autherized_user = found_user.authenticate(params[:password])
	    end
	end
	 if autherized_user
	 	session[:user_id]= autherized_user.id
	 	$name = autherized_user.first_name.to_s+" "+autherized_user.last_name.to_s
	  	flash[:notice]="You are now logged in. "
	  	redirect_to(admin_path)
	  else
	  	flash.now[:notice]="Invalid Username/Password"
	  	render('login')
	  end	
	end

  def logout
  	session[:user_id]=nil
  	flash[:notice]='Logged out'
  	redirect_to(access_login_path)
  end

  private

   def confirm_logged_in
   	unless session[:user_id]
   		flash[:notice]="Please Login first"
   		redirect_to(access_login_path)
   	end
   end

end





