class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments

  #attr_accessible :name

  #User::Roles
  # The available roles
  #Roles = '%i[ :admin , :default ]'.freeze

  #def is?( requested_role )
  #  self.role == requested_role.to_s
  #end
end
