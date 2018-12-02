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

ActiveRecord::Schema.define(version: 2018_12_02_101640) do

  create_table "diff_codes", force: :cascade do |t|
    t.text "html"
    t.text "text"
    t.datetime "scraped_code_created_at"
    t.integer "scraping_page_id"
    t.integer "scraped_code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scraped_code_id"], name: "index_diff_codes_on_scraped_code_id"
    t.index ["scraping_page_id"], name: "index_diff_codes_on_scraping_page_id"
  end

  create_table "scraped_codes", force: :cascade do |t|
    t.text "html"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "scraping_html_element_id"
    t.index ["scraping_html_element_id"], name: "index_scraped_codes_on_scraping_html_element_id"
  end

  create_table "scraping_html_elements", force: :cascade do |t|
    t.string "target_element"
    t.integer "scraping_page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scraping_page_id"], name: "index_scraping_html_elements_on_scraping_page_id"
  end

  create_table "scraping_pages", force: :cascade do |t|
    t.string "page_url"
    t.integer "scraping_frequency"
    t.string "target_element"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "file_name"
    t.datetime "scraping_latest_date"
    t.string "directory_path"
    t.string "charset"
    t.boolean "is_robots_allowed"
  end

end
