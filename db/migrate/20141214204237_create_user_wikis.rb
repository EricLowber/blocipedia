class CreateUserWikis < ActiveRecord::Migration
  def change
    create_table :user_wikis do |t|
      t.integer :user_id
      t.integer :wiki_id
    end
  end
end
