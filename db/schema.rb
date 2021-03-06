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

ActiveRecord::Schema.define(:version => 20130624052229) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "foods", :force => true do |t|
    t.string   "name",                                             :default => "",  :null => false
    t.string   "category",                                         :default => "",  :null => false
    t.integer  "commitment",                                       :default => 0,   :null => false
    t.integer  "serving",                                          :default => 0,   :null => false
    t.integer  "calories",                                         :default => 0,   :null => false
    t.decimal  "total_fat",          :precision => 5, :scale => 2, :default => 0.0, :null => false
    t.decimal  "saturated_fat",      :precision => 5, :scale => 3, :default => 0.0, :null => false
    t.integer  "cholesterol",                                      :default => 0,   :null => false
    t.integer  "sodium",                                           :default => 0,   :null => false
    t.decimal  "total_carbohydrate", :precision => 5, :scale => 2, :default => 0.0, :null => false
    t.decimal  "fiber",              :precision => 5, :scale => 2, :default => 0.0, :null => false
    t.decimal  "sugar",              :precision => 5, :scale => 2, :default => 0.0, :null => false
    t.decimal  "protein",            :precision => 5, :scale => 2, :default => 0.0, :null => false
    t.integer  "ratio_fat",                                        :default => 0,   :null => false
    t.integer  "ratio_carb",                                       :default => 0,   :null => false
    t.integer  "ratio_protein",                                    :default => 0,   :null => false
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
  end

  create_table "sleeps", :force => true do |t|
    t.integer  "user_id"
    t.integer  "hours",      :default => 1,            :null => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.date     "sleep_date", :default => '2013-06-23', :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
