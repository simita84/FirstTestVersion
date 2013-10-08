require "digest/sha1"
class Member < ActiveRecord::Base
  # attr_accessible :title, :body
  
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

  
  
  
  
  
  
end
