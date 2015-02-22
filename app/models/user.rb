class User < ActiveRecord::Base
	####   Properties and relations
	has_secure_password
	has_attached_file :avatar, styles: {:medium => '300x300>', :thumb => '100x100>'}

	####  VALIDATIONS for register
	validates :email, presence: true, uniqueness: true, 
	 									format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :password, presence: true, confirmation: true, :length => {:within => 6..40},
                    :on => :create

  ####  VALIDATIONS for update
 #  validates :password, confirmation: true, :length => {:within => 6..40}, :allow_blank => true,
 #                       :on => :update

	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
end
