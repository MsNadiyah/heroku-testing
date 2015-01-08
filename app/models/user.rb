class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  # for each field, mongoid is creating getters and setters behind the scenes

  def password=(unencrypted_password) # setter method
  	# pass the method an unencrypted password
  	self.password_digest = BCrypt::Password.create(unencrypted_password)
  end

  # a new method to authenticate a user

  # Tests to see whether the encrypted version of the password entered matches the encrypted password we've saved
  # The encryption of the password users enter to log-in is heappening in the "BCrypt::Password" magic!
  def authenticate(unencrypted_password) # getter method
	
  	if BCrypt::Password.new(self.password_digest) == unencrypted_password
  		return self
  	else
  		return false
  	end

  end

end
