class TagsController < ApplicationController
	
	def new
	  @tag = Tag.new
	  @title = "tags"
	end
	
	def create
		@user = current_user
		@user.tags.create(:tag => params[:tag][:tag])
		redirect_to user_path(@user)
	end
	
	def show
		@user = current_user
		@tag = Tag.find(params[:id])
	end
	
end
