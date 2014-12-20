class RenameUserWikisToCollaborations < ActiveRecord::Migration
  def change
    rename_table :user_wikis, :collaborations
  end
end
