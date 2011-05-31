require 'digest'

class User < ActiveRecord::Base

	attr_accessor :password
	attr_accessible :name, :email, :password, :password_confirmation
	
	has_many :entries, :dependent => :destroy
	
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates :name, :presence => true,
				     :length => { :maximum => 50 }
				     
	validates :email, :presence => true,
					  :format => {:with => email_regex },
					  :uniqueness => { :case_sensitive => false }
	
	validates :password, :presence => true,
						 :confirmation => true,
						 :length => { :within => 6..40 }
						 
	before_save :encrypt_password
	
	def has_password?(submitted_password)
		# compare encrypted_password with the encrypted version of submitted_password
		self.encrypted_password == encrypt(submitted_password)
	end
	
	def self.authenticate(email, submitted_password)
		user = User.find_by_email(email)
		# return nil if no such user
		return nil if user.nil?
		# return user object if password is good
		return user if user.has_password?(submitted_password)
		# returns nil at end of method in case of password mismatch
	end
	
	def self.authenticate_with_salt(id, cookie_salt)
		user = User.find_by_id(id)
		(user && user.salt == cookie_salt) ? user : nil
	end
	
	private
		
		def encrypt_password
			self.salt = make_salt if new_record?
			self.encrypted_password = encrypt(self.password)
		end
		
		def encrypt(string)
			secure_hash("#{self.salt}--#{string}")
		end
		
		def make_salt
			secure_hash("#{Time.now.utc}--#{self.password}")
		end
		
		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end
end
