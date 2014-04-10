class User < ActiveRecord::Base

	validates_presence_of :email, :full_name, :location, :password
	validates_length_of :bio, :minimum => 30, :allow_blanck => false
	validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	validates_uniqueness_of :email

	has_secure_password
end
