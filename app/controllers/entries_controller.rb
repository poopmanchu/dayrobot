class EntriesController < ApplicationController

	require 'mail'
	skip_before_filter :verify_authenticity_token
	
	def create
		message = Mail.new(params[:message])
		@entry = Entry.new(:content => message.subject)
		@entry.save
		
		#render :text => message.subject
		#Rails.logger.log message.subject
		#Rails.logger.log message.body.decoded
		#Rails.logger.log message.attachments.first.inspect
		
		render :text => 'success', :status => 200
	end

end
