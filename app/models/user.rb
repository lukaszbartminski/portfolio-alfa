class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable (not active user until user confirm his email), :lockable(ability to lock user, if x login attempt failed), :timeoutable (logout user after x time) and :omniauthable (ability to log into app with Facebook, Gmail or so) :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
