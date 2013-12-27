class AlterItemsAddMemberName < ActiveRecord::Migration
  def up
     add_column("items","member_username",:string,:null=>false)
      add_index("items","member_username")
  end

  def down
    
      remove_index("items","member_username")
      remove_column("items","member_username")
  end
end

 