# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131004205630) do

  create_table "admin_users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username",        :limit => 25, :null => false
    t.string   "emailId",         :limit => 40
    t.string   "hashed_password"
    t.string   "salt",            :limit => 40
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "admin_users", ["username"], :name => "index_admin_users_on_username"

  create_table "contacts", :force => true do |t|
    t.string   "name",       :limit => 25, :null => false
    t.string   "emailid",                  :null => false
    t.string   "facebook",                 :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "homes", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.integer  "index",          :null => false
    t.string   "name",           :null => false
    t.text     "content"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "member_emailid", :null => false
  end

  add_index "items", ["member_emailid"], :name => "index_items_on_member_emailid"

  create_table "members", :force => true do |t|
    t.string   "username",        :limit => 25, :null => false
    t.string   "first_name",      :limit => 50, :null => false
    t.string   "last_name",       :limit => 50, :null => false
    t.string   "hashed_password", :limit => 40, :null => false
    t.string   "salt"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "members", ["username"], :name => "index_members_on_username"

  create_table "products", :force => true do |t|
    t.integer  "index",      :null => false
    t.string   "title",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recipes", :force => true do |t|
    t.integer  "index",                        :null => false
    t.text     "content"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "title",          :limit => 50, :null => false
    t.integer  "member_emailid",               :null => false
  end

  add_index "recipes", ["member_emailid"], :name => "index_recipes_on_member_emailid"

  create_table "reviews", :force => true do |t|
    t.integer  "index"
    t.integer  "product_id",                    :null => false
    t.string   "title",           :limit => 25, :null => false
    t.text     "content"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "member_username"
  end

  add_index "reviews", ["member_username"], :name => "index_reviews_on_member_username"
  add_index "reviews", ["product_id"], :name => "index_reviews_on_product_id"

  create_table "signs", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stuffs", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
