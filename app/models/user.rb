class User < ActiveRecord::Base


def admin?
  role == 'admin'
end

def member?
  role == 'member'
end

def premium_member?
  role == 'premium_member'
end


has_many :user_wikis
has_many :wikis, through: :user_wikis

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

end
