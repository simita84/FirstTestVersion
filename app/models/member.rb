require "digest/sha1"
class Member < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :memberphoto,:username, :first_name,:last_name,:password
   has_attached_file :memberphoto, :styles => { :medium => "300x300>", :thumb =>"50x50>" }



   before_save :create_hashed_password
    after_save :clear_password
    attr_accessor :password


  has_many :reviews
  has_many :recipes
  has_many :items
  
   
    #authorizing the Member
    def self.authorize(username="",password="")
      member=Member.find_by_username(username)
      if member && member.password_match?(password)
        return member
      else
        return false
      end

     end


     #password comparison

     def password_match?(password="")
       hashed_password == Member.hash_with_salt(password,salt)
     end


    #make salt
    def self.make_salt(username="")
      Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end
    #make hash
    def self.hash_with_salt(password="",salt="")
      Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
    end

    #method to return name of the Member
    def name
      "#{first_name}  #{last_name}"

    end
    
    private

       def create_hashed_password
         # Whenever :password has a value hashing is needed
         unless password.blank?
           # always use "self" when assigning values
           self.salt = Member.make_salt(username) if salt.blank?
           self.hashed_password = Member.hash_with_salt(password, salt)
         end
       end

       def clear_password
         # for security and b/c hashing is not needed
         self.password = nil
       end
    
    

  
  
  
  
  
  
end
