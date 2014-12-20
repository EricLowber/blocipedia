class User < ActiveRecord::Base

has_many :user_wikis
has_many :wikis, through: :user_wikis

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

end
