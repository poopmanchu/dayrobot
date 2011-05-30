class UsersController < ApplicationController
 
 	def new
  		@user = User.new
  		@title = "register"
	end
	
	def show
		@user = User.find(params[:id])
		@title = @user.name
	end
	
	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "welcome to dayrobot."
			redirect_to user_path(@user)
		else
			@title = "register"
			render 'new'
		end
	end

end
