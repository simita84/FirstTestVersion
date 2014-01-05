require "digest/sha1"

class Admin < ActiveRecord::Base
  
  #mapping to events
  has_many :events
  attr_accessor :password
  attr_protected :hashed_password,:salt
  
  
  
  validates_uniqueness_of :emailId,:message=>"EmailID already taken"
  
   # attr_accessible :title, :body
    before_save :create_hashed_password
    after_save :clear_password



    

    
  #scope to sort by name
    scope :sorted,order("admin_users.last_name ASC,admin_users.first_name ASC")


    #attr_protected :hashed_password,:salt 

    #authorizing the user
    def self.authorize(username="",password="")
      user=Admin.find_by_username(username)
      if user && user.password_match?(password)
        return user
      else
        return false
      end

     end


     #password comparison

     def password_match?(password="")
       hashed_password == Admin.hash_with_salt(password,salt)
     end


    #make salt
    def self.make_salt(username="")
      Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end
    #make hash
    def self.hash_with_salt(password="",salt="")
      Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
    end
    
    private

       def create_hashed_password
         # Whenever :password has a value hashing is needed
         unless password.blank?
           # always use "self" when assigning values
           self.salt = Admin.make_salt(username) if salt.blank?
           self.hashed_password = Admin.hash_with_salt(password, salt)
         end
       end

       def clear_password
         # for security and b/c hashing is not needed
         self.password = nil
       end
    

    #method to return name of the AdminUser
    def name
      "#{first_name}  #{last_name}"

    end

  
end
