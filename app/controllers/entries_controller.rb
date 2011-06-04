class EntriesController < ApplicationController

	require 'mail'
	skip_before_filter :verify_authenticity_token
	
	def create
		
		message = Mail.new(params[:message])
		
		date_regex = 'what did you do today\?\s\((\d{4}-\d{2}-\d{2})\)'
			
		if message.subject.match(date_regex)
			entry_date_string =  message.subject.match(date_regex)[1]
			entry_date = Date.strptime(entry_date_string, '%F')
		else
			entry_date = "nope"
			#render :text => 'failure', :status => 404
		end
		
		message_from = message.from
		
		@user = User.find_by_email(message_from)
		
		if @user.nil?
			# handle
		else		
			content = "#{message.parts[0].body.decoded} - from: #{message.from}"
			@user.entries.create!(:entry_date => entry_date, :content => content)
			render :text => 'success', :status => 200
		end
	end
		
	def index
		@entries = Entry.all
	end

end
