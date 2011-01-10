# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110110035712) do

  create_table "addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apartments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "move_id"
    t.integer  "research_id"
    t.integer  "neighborhood_id"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "county"
    t.string   "drive"
    t.string   "distance"
    t.string   "school_district"
    t.string   "price"
    t.string   "bedrooms"
    t.string   "bathrooms"
    t.string   "link"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", :force => true do |t|
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "attachings_count",  :default => 0
    t.datetime "created_at"
    t.datetime "data_updated_at"
  end

  create_table "attachings", :force => true do |t|
    t.integer  "attachable_id"
    t.integer  "asset_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachings", ["asset_id"], :name => "index_attachings_on_asset_id"
  add_index "attachings", ["attachable_id"], :name => "index_attachings_on_attachable_id"

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "communities", :force => true do |t|
    t.integer  "move_id"
    t.integer  "neighborhood_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cons", :force => true do |t|
    t.string   "con"
    t.integer  "negative_id"
    t.string   "negative_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "move_id"
  end

  create_table "ends", :force => true do |t|
    t.integer  "move_id"
    t.integer  "installation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "move_id"
  end

  create_table "families", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "school_level"
    t.string   "branch"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "position"
    t.string   "family_type"
    t.string   "email"
    t.datetime "birthday",       :limit => 255
    t.string   "service_member"
  end

  create_table "families_schools", :id => false, :force => true do |t|
    t.integer "family_id"
    t.integer "school_id"
  end

  create_table "homes", :force => true do |t|
    t.integer  "research_id"
    t.integer  "neighborhood_id"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "category"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "county"
    t.string   "drive"
    t.string   "distance"
    t.string   "school_district"
    t.string   "price"
    t.string   "bedrooms"
    t.string   "bathrooms"
    t.text     "note"
    t.integer  "move_id"
  end

  create_table "installations", :force => true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.string   "branch"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itineraries", :force => true do |t|
    t.integer  "user_id"
    t.integer  "move_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "lists", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "move_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "family_id"
    t.string   "position"
  end

  create_table "logged_exceptions", :force => true do |t|
    t.string   "exception_class"
    t.string   "controller_name"
    t.string   "action_name"
    t.text     "message"
    t.text     "backtrace"
    t.text     "environment"
    t.text     "request"
    t.datetime "created_at"
  end

  create_table "moves", :force => true do |t|
    t.integer  "user_id"
    t.string   "to"
    t.string   "from"
    t.datetime "date"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "move_type"
    t.string   "active"
  end

  create_table "moves_neighborhoods", :force => true do |t|
    t.integer  "neighborhood_id"
    t.integer  "move_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "neighborhood_notes", :force => true do |t|
    t.integer  "neighborhood_id"
    t.integer  "move_id"
    t.text     "note"
    t.string   "public"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "privacy"
  end

  create_table "neighborhoods", :force => true do |t|
    t.integer  "research_id"
    t.string   "name"
    t.string   "distance"
    t.string   "drive_distance"
    t.string   "school_district"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "move_id"
    t.integer  "installation_id"
    t.string   "location"
    t.string   "category"
    t.text     "info"
  end

  create_table "neighborhoods_parts", :force => true do |t|
    t.integer  "neighborhood_id"
    t.integer  "move_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.integer  "research_id"
    t.string   "name"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "move_id"
  end

  create_table "order_transactions", :force => true do |t|
    t.integer  "order_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "card_id"
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "pets", :force => true do |t|
    t.string   "name"
    t.string   "pet_type"
    t.string   "microchip"
    t.string   "breed"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "style"
  end

  create_table "pros", :force => true do |t|
    t.string   "pro"
    t.integer  "positive_id"
    t.string   "positive_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "move_id"
  end

  create_table "researches", :force => true do |t|
    t.integer  "user_id"
    t.integer  "move_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "neighborhood_id"
    t.text     "review"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", :force => true do |t|
    t.integer  "research_id"
    t.integer  "neighborhood_id"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "link"
    t.string   "phone"
    t.string   "level"
    t.integer  "family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "school_district"
    t.string   "school_type"
    t.string   "cost"
    t.integer  "move_id"
    t.string   "drive"
    t.string   "distance"
    t.text     "note"
  end

  create_table "spouses", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "branch"
    t.string   "rank"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "starts", :force => true do |t|
    t.integer  "move_id"
    t.integer  "installation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.integer  "list_id"
    t.string   "task"
    t.boolean  "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "position"
    t.boolean  "finished"
  end

  create_table "things", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.string   "brand"
    t.string   "model_number"
    t.string   "serial_number"
    t.datetime "purchase_date"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "price"
    t.integer  "user_id"
  end

  create_table "trips", :force => true do |t|
    t.integer  "itinerary_id"
    t.string   "to"
    t.string   "from"
    t.datetime "date"
    t.string   "transportation"
    t.string   "destination_name"
    t.string   "address"
    t.string   "state"
    t.string   "city"
    t.integer  "zip"
    t.string   "phone"
    t.string   "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "drive_time"
    t.string   "destination_type"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "level"
    t.datetime "membership"
  end

end
