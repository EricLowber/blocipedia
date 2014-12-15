class DropUsersWikis < ActiveRecord::Migration
  def ch
  drop_table :UsersWikis
  end
end
