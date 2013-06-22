class Admin < ActiveRecord::Base

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  validates_presence_of :username
  validates_uniqueness_of :username
end
