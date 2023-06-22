# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema[7.0].define(version: 2023_06_21_161045) do
=======
ActiveRecord::Schema[7.0].define(version: 2023_06_22_105312) do
>>>>>>> 8636fbeb95c9511442a7fcc0aba8705345155c95
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "city"
    t.bigint "contact_num"
    t.text "skills"
    t.string "experience"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "application_status"
    t.string "otp"
    t.boolean "appliedforjob", default: false
    t.integer "job_detail_id"
    t.index ["job_detail_id"], name: "index_employees_on_job_detail_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "employers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "address"
    t.string "email"
    t.string "city"
    t.string "state"
    t.string "country"
    t.bigint "contact"
    t.index ["user_id"], name: "index_employers_on_user_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "job_detail_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_job_applications_on_employee_id"
    t.index ["job_detail_id"], name: "index_job_applications_on_job_detail_id"
  end

  create_table "job_details", force: :cascade do |t|
    t.bigint "employer_id"
    t.string "Job_title"
    t.text "Job_summary"
    t.text "Qualification_skills"
    t.text "Experience"
    t.integer "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "Applicants"
    t.integer "ApplicationCount"
    t.string "job_url"
    t.integer "category_id"
    t.integer "employee_id"
    t.index ["employee_id"], name: "index_job_details_on_employee_id"
    t.index ["employer_id"], name: "index_job_details_on_employer_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "job_applications", "employees"
  add_foreign_key "job_applications", "job_details"
end
