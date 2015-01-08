class SessionsController < ApplicationController

	def new
	end

	# Craft the cookie that gets stored on the computer	
	def create
		# using where instead of find_by requires that you call .first at the end of the parameter call
		@user = User.find_by(email: params[:login][:email])

		#If you find a user with that email address and authenticate is successful...
		if @user && @user.authenticate(params[:login][:password])
			# Get the user_id and save it as a string 
			session[:user_id] = @user.id.to_s
			redirect_to users_path
		else
			# let them try again
			redirect_to login_path
		end
	end

	def destroy
		session.delete :user_id # delete the user-id from the session hash
	end


end
