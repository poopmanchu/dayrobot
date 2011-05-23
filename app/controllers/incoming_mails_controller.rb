class IncomingMailsController < ApplicationController
	
	require 'mail'
	skip_before_filter :verify_authenticity_token
	
	def create
		message = Mail.new(params[:message])
		Entry.new(:content => message.subject)
		render :text => message.subject
		Rails.logger.log message.subject
		Rails.logger.log message.body.decoded
		Rails.logger.log message.attachments.first.inspect
		
		render :text => 'success', :status => 200
	end

end
