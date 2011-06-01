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
	
end
