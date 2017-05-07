class User < ApplicationRecord
  has_many :blogs
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :registerable
         #:recoverable, :validatable

 def email_required?
   false
 end

 def email_changed?
   false
 end

end
