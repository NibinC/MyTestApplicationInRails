# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  
  def welcome_mail
  	comnt = AdminUser.last 
  	UserMailer.welcome_mail(comnt)
  end
end
