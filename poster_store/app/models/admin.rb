#Team No:11
#Date of submission: 6/6/2014
#To store Admin login(email address) and password
class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are: :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
end
