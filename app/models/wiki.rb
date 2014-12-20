class Wiki < ActiveRecord::Base
  has_many :user_wikis
  has_many :users, through: :user_wikis
end
