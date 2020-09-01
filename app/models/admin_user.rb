class AdminUser < ApplicationRecord
	

	has_secure_password

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
 

end
