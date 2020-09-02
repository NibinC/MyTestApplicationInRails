class AdminUser < ApplicationRecord
	

 has_secure_password
 
 EMAIL_FORMAT =  /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
 PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[[:^alnum:]]) # Must contain a symbol
/x

 validates :username, :presence=>true,
 					  :length=> {:maximum=>50},
 					  :uniqueness=>true

 validates :password, :presence=>true,
 					  :length=>{:maximum=>50},
 					  :format=>{:with=>PASSWORD_FORMAT}
 
  validates :email, :presence=>true,
				    :uniqueness=>true,
				    :length=>{:maximum=>30},
				    :format=>{:with=>EMAIL_FORMAT}	
end
