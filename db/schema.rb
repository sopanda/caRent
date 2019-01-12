# frozen_string_literal: true

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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_181_014_100_911) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'bookings', force: :cascade do |t|
    t.bigint 'renter_id'
    t.bigint 'car_id'
    t.integer 'price'
    t.date 'start_date'
    t.date 'end_date'
    t.boolean 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['car_id'], name: 'index_bookings_on_car_id'
    t.index ['renter_id'], name: 'index_bookings_on_renter_id'
  end

  create_table 'cars', force: :cascade do |t|
    t.bigint 'owner_id'
    t.string 'model'
    t.integer 'year'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.float 'latitude'
    t.float 'longitude'
    t.string 'address'
    t.string 'status'
    t.integer 'daily_price'
    t.index ['owner_id'], name: 'index_cars_on_owner_id'
  end

  create_table 'reviews', force: :cascade do |t|
    t.integer 'author_id'
    t.integer 'booking_id'
    t.string 'text'
    t.integer 'rating'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_reviews_on_author_id'
    t.index ['booking_id'], name: 'index_reviews_on_booking_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'username'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'bookings', 'cars'
  add_foreign_key 'bookings', 'users', column: 'renter_id'
  add_foreign_key 'cars', 'users', column: 'owner_id'
end
