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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170227234537) do

  create_table "answers", force: :cascade do |t|
    t.integer  "reply_id"
    t.integer  "question_id"
    t.integer  "possible_answer_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "answers", ["possible_answer_id"], name: "index_answers_on_possible_answer_id"
  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["reply_id"], name: "index_answers_on_reply_id"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.string   "color"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "company_name"
    t.string   "role",                    default: "company"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.string   "name_agent"
    t.string   "state",                   default: "Nuevo"
    t.string   "stage",                   default: "Prealta"
    t.integer  "sector_id"
    t.string   "name"
    t.string   "email_user"
    t.boolean  "active",                  default: true
    t.integer  "agent_id"
    t.integer  "emprered_id"
    t.string   "company_type",            default: ""
    t.string   "vat",                     default: ""
    t.string   "street",                  default: ""
    t.string   "street2",                 default: ""
    t.string   "city",                    default: ""
    t.string   "cel",                     default: ""
    t.date     "date_start"
    t.date     "date_end"
    t.string   "line_business",           default: ""
    t.integer  "num_workers",             default: 0
    t.string   "annual_sales",            default: ""
    t.text     "company_history",         default: ""
    t.string   "company_products",        default: ""
    t.string   "company_market",          default: ""
    t.string   "company_problems",        default: ""
    t.string   "name_director",           default: ""
    t.string   "staff_interviewed",       default: ""
    t.string   "survey_period",           default: ""
    t.string   "name_created",            default: ""
    t.boolean  "completed",               default: false
    t.integer  "user_login_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "done",                    default: false
    t.string   "image_logo_file_name"
    t.string   "image_logo_content_type"
    t.integer  "image_logo_file_size"
    t.datetime "image_logo_updated_at"
    t.integer  "survey_analysis_id"
    t.integer  "municipio_id"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "activity_id"
  end

  add_index "companies", ["activity_id"], name: "index_companies_on_activity_id"
  add_index "companies", ["agent_id"], name: "index_companies_on_agent_id"
  add_index "companies", ["emprered_id"], name: "index_companies_on_emprered_id"
  add_index "companies", ["municipio_id"], name: "index_companies_on_municipio_id"
  add_index "companies", ["sector_id"], name: "index_companies_on_sector_id"
  add_index "companies", ["survey_analysis_id"], name: "index_companies_on_survey_analysis_id"
  add_index "companies", ["user_login_id"], name: "index_companies_on_user_login_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "economic_activities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "allDay"
    t.string   "name_exhibitor"
    t.integer  "level_id"
    t.string   "hours"
    t.string   "price"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "events", ["level_id"], name: "index_events_on_level_id"

  create_table "levels", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "login_managers", force: :cascade do |t|
    t.string   "email_contact"
    t.text     "about_us"
    t.text     "privacy"
    t.text     "we_do"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "municipios", force: :cascade do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "municipios", ["region_id"], name: "index_municipios_on_region_id"

  create_table "possible_answers", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "title"
    t.string   "description"
    t.integer  "grade"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "solution"
  end

  add_index "possible_answers", ["question_id"], name: "index_possible_answers_on_question_id"

  create_table "questions", force: :cascade do |t|
    t.integer  "survey_id"
    t.integer  "category_id"
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "questions", ["category_id"], name: "index_questions_on_category_id"
  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id"

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "survey_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "done",       default: false
  end

  add_index "replies", ["survey_id"], name: "index_replies_on_survey_id"
  add_index "replies", ["user_id"], name: "index_replies_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "role"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.binary   "image_sector"
    t.boolean  "active",             default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "subsectors", force: :cascade do |t|
    t.string   "name"
    t.integer  "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subsectors", ["sector_id"], name: "index_subsectors_on_sector_id"

  create_table "survey_analyses", force: :cascade do |t|
    t.integer  "agente_id"
    t.integer  "user_company_id"
    t.integer  "reply_id"
    t.text     "organizational"
    t.text     "innovation_management"
    t.text     "innovation"
    t.text     "guilds"
    t.text     "copetential"
    t.integer  "num_company"
    t.integer  "num_jobs"
    t.integer  "create_jobs"
    t.integer  "num_emprered"
    t.integer  "num_electronic_kiosk"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.date     "date_print"
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "role_id"
    t.boolean  "active",                 default: true
    t.boolean  "available",              default: true
    t.integer  "num_max_companies",      default: 5,    null: false
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "change_password",        default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"

end
