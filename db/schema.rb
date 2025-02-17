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

ActiveRecord::Schema.define(version: 2019_05_28_003648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "children", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "gender"
    t.jsonb "child_lives_with"
    t.jsonb "race"
    t.string "agency_child_id"
    t.jsonb "health_insurance"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "family_id"
    t.integer "item_needed_diaperid"
    t.boolean "active", default: true
    t.index ["family_id"], name: "index_children_on_family_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "guardian_first_name"
    t.string "guardian_last_name"
    t.string "guardian_zip_code"
    t.string "guardian_country"
    t.string "guardian_phone"
    t.string "agency_guardian_id"
    t.integer "home_adult_count"
    t.integer "home_child_count"
    t.integer "home_young_child_count"
    t.jsonb "sources_of_income"
    t.boolean "guardian_employed"
    t.jsonb "guardian_employment_type"
    t.decimal "guardian_monthly_pay"
    t.jsonb "guardian_health_insurance"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "partner_id"
    t.index ["partner_id"], name: "index_families_on_partner_id"
  end

  create_table "family_request_children", force: :cascade do |t|
    t.bigint "family_request_id"
    t.bigint "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_family_request_children_on_child_id"
    t.index ["family_request_id"], name: "index_family_request_children_on_family_request_id"
  end

  create_table "family_requests", force: :cascade do |t|
    t.bigint "partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "sent"
    t.index ["partner_id"], name: "index_family_requests_on_partner_id"
  end

  create_table "item_requests", force: :cascade do |t|
    t.string "name"
    t.string "quantity"
    t.bigint "partner_request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "partner_key"
    t.integer "item_id"
    t.index ["item_id"], name: "index_item_requests_on_item_id"
    t.index ["partner_request_id"], name: "index_item_requests_on_partner_request_id"
  end

  create_table "partner_requests", force: :cascade do |t|
    t.text "comments"
    t.bigint "partner_id"
    t.bigint "organization_id"
    t.boolean "sent", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_partner_requests_on_organization_id"
    t.index ["partner_id"], name: "index_partner_requests_on_partner_id"
  end

  create_table "partners", force: :cascade do |t|
    t.integer "diaper_bank_id"
    t.string "executive_director_name"
    t.string "program_contact_name"
    t.string "pick_up_name"
    t.text "application_data"
    t.integer "diaper_partner_id"
    t.string "partner_status", default: "pending"
    t.string "name"
    t.string "distributor_type"
    t.string "agency_type"
    t.text "agency_mission"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "website"
    t.string "facebook"
    t.string "twitter"
    t.integer "founded"
    t.boolean "form_990"
    t.string "program_name"
    t.text "program_description"
    t.string "program_age"
    t.boolean "case_management"
    t.boolean "evidence_based"
    t.text "evidence_based_description"
    t.text "program_client_improvement"
    t.string "diaper_use"
    t.string "other_diaper_use"
    t.boolean "currently_provide_diapers"
    t.boolean "turn_away_child_care"
    t.string "program_address1"
    t.string "program_address2"
    t.string "program_city"
    t.string "program_state"
    t.integer "program_zip_code"
    t.string "max_serve"
    t.text "incorporate_plan"
    t.boolean "responsible_staff_position"
    t.boolean "storage_space"
    t.text "describe_storage_space"
    t.boolean "trusted_pickup"
    t.boolean "income_requirement_desc"
    t.boolean "serve_income_circumstances"
    t.boolean "income_verification"
    t.boolean "internal_db"
    t.boolean "maac"
    t.integer "population_black"
    t.integer "population_white"
    t.integer "population_hispanic"
    t.integer "population_asian"
    t.integer "population_american_indian"
    t.integer "population_island"
    t.integer "population_multi_racial"
    t.integer "population_other"
    t.string "zips_served"
    t.integer "at_fpl_or_below"
    t.integer "above_1_2_times_fpl"
    t.integer "greater_2_times_fpl"
    t.integer "poverty_unknown"
    t.string "ages_served"
    t.string "executive_director_phone"
    t.string "executive_director_email"
    t.string "program_contact_phone"
    t.string "program_contact_mobile"
    t.string "program_contact_email"
    t.string "pick_up_method"
    t.string "pick_up_phone"
    t.string "pick_up_email"
    t.string "distribution_times"
    t.string "new_client_times"
    t.string "more_docs_required"
    t.string "sources_of_funding"
    t.string "sources_of_diapers"
    t.string "diaper_budget"
    t.string "diaper_funding_source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["diaper_bank_id"], name: "index_partners_on_diaper_bank_id"
    t.index ["email"], name: "index_partners_on_email", unique: true
    t.index ["invitation_token"], name: "index_partners_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_partners_on_invitations_count"
    t.index ["invited_by_id"], name: "index_partners_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_partners_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_partners_on_reset_password_token", unique: true
  end

  add_foreign_key "children", "families"
  add_foreign_key "families", "partners"
  add_foreign_key "family_request_children", "children"
  add_foreign_key "family_request_children", "family_requests"
  add_foreign_key "family_requests", "partners"
  add_foreign_key "item_requests", "partner_requests"
end
