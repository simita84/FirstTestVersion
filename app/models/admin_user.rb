require "digest/sha1"

class AdminUser < ActiveRecord::Base
   # attr_accessible :title, :body
    

  #scope to sort by name
    scope :sorted,order("admin_users.last_name ASC,admin_users.first_name ASC")


    #attr_protected :hashed_password,:salt 

    #authorizing the user
    def self.authorize(username="",password="")
      user=AdminUser.find_by_username(username)
      if user && user.password_match?(password)
        return user
      else
        return false
      end

     end


     #password comparison

     def password_match?(password="")
       hashed_password == AdminUser.hash_with_salt(password,salt)
     end


    #make salt
    def self.make_salt(username="")
      Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end
    #make hash
    def self.hash_with_salt(password="",salt="")
      Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
    end

    #method to return name of the AdminUser
    def name
      "#{first_name}  #{last_name}"

    end

  
end
