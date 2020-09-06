class UserMailer < ApplicationMailer

	def welcome_mail(user_details)
		@admin = user_details
	
		mail(to: @admin.email,subject: 'Welcome to my test application')
	end
end
