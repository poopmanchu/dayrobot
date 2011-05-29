class EntriesController < ApplicationController

	require 'mail'
	skip_before_filter :verify_authenticity_token
	
	def create
		
		message = Mail.new(params[:message])
		
		date_regex = '.*what did you do today\?\s\((\d{4}-\d{2}-\d{2})\).*'
			
		if message.subject.match(date_regex)
			entry_date =  message.subject.match(date_regex)[1]
		else
			render :text => 'failure', :status => 404
		end
		
		@entry = Entry.new(:entry_date => entry_date, :from => message.from, :content => message.parts[0].body.decoded) 
		@entry.save
		
		#render :text => message.subject
		#Rails.logger.log message.subject
		#Rails.logger.log message.body.decoded
		#Rails.logger.log message.attachments.first.inspect
		
		render :text => 'success', :status => 200
	end
		
	def index
		@entries = Entry.all
	end

end
