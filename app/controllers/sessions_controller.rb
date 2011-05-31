class SessionsController < ApplicationController
  def new
   @title = "login"
  end
  
  def create
  	user = User.authenticate(params[:session][:email],
  							 params[:session][:password])
  	if user.nil?
  		flash.now[:error] = "invalid email/password combo"
  		@title = "login"
  		render 'new'
  	else
  		login user
  		redirect_to user
  	end
  	
  end
  
  def destroy
  	logout
  	redirect_to root_path
  end

end
