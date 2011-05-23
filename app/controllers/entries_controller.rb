class EntriesController < ApplicationController

	require 'mail'
	skip_before_filter :verify_authenticity_token
	
	def create
		
		message = Mail.new(params[:message])
		
		entry_date = message.subject.extract_date
		
		@entry = Entry.new(:subject => entry_date, :content => message.parts[0].body.decoded) 
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
	
	private
		
		def extract_date(subject)
			date_regex = 'what did you do today\?\s\((\d{4}-\d{2}-\d{2})\)'
			
			if subject.match(date_regex)
				return subject.match(date_regex)[1]
			else
				return "N/A"
			end
			
		end

end
