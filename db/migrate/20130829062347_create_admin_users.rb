class CreateAdminUsers < ActiveRecord::Migration
  
      def change
        create_table :admin_users do |t|
          t.string "first_name"
          t.string "last_name" 
          t.string "username",:limit=>25,:null=>false
          t.string "emailId",:limit=>40
          t.string "hashed_password"
          t.string "salt",:limit=>40
          t.timestamps
           puts "**About to add an index**"

        end
         add_index("admin_users","username")
    end

        def down
            drop_table :admin_users
        end

  end
