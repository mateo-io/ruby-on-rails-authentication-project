class User < ActiveRecord::Base
	attr_accessor :remember_token
	#One to many R with posts
	has_many :posts
	
	#Name validations
	validates :name, presence: true, length: {maximum: 20}

	#Valid email using RegEx, unique emails as they are the usernames
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255},
		format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false}

	#Password presence and length >6
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
	has_secure_password

	def User.new_token
		SecureRandom.urlsafe_base64
		
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token)
	end

	def create_token
		self.remember_token= User.new_token
		update_attribute(:remember_digest, User.encrypt(remember_token))
	end
end
