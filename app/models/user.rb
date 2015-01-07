class User < ActiveRecord::Base
has_many :collaborations
has_many :wikis, through: :collaborations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, presence: true

def admin?
  role == 'admin'
end

def member?
  role == 'member'
end

def premium_member?
  role == 'premium_member'
 end
end
