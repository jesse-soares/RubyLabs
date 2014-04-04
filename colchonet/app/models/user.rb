class User < ActiveRecord::Base

	validates_presence_of :email, :full_name, :location, :password
	validates_confirmation_of :password
	validates_length_of :bio, :minimum => 30, :allow_blanck => false
	validates_format_of :email => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
