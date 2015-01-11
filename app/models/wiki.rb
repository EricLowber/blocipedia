class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations, dependent: :destroy
  has_many :users, through: :collaborations
  
scope :visible_to, ->(user) {Wiki.where("user_id = ?", user.id)}


  def owner
    user
  end

  def collaborator
    users
  end
end
