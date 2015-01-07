class AddIndexToWikis < ActiveRecord::Migration
   def self.up
    add_index :wikis, :user_id, :name=>'user_index'
  end

  def self.down
    remove_index :wikis, 'user_index'
  end
end
