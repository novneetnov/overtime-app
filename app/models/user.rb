class User < ActiveRecord::Base
	has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates_presence_of :first_name, :last_name, :phone
	validates :phone, length: { is: 10 }

	PHONE_REGEX = /\A[0-9]+\z/

	validates :phone, format: { with: PHONE_REGEX, message: "Only integers allowed" }

	def full_name
		 last_name.upcase + ", " + first_name.upcase
	end
end
