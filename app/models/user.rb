class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :editor], multiple: false)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable (not active user until user confirm his email), :lockable(ability to lock user, if x login attempt failed), :timeoutable (logout user after x time) and :omniauthable (ability to log into app with Facebook, Gmail or so) :trackable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # 'name' attr is required to sucessfully registration. Email and password are set defoult to be required by devise gem.
  validates_presence_of :name

  def first_name
  	self.name.split.first
  end

  def last_name
  	self.name.split.last
  end

end
