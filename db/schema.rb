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

ActiveRecord::Schema.define(version: 2026_02_02_215935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoices", force: :cascade do |t|
    t.string "invoice_uuid", null: false
    t.string "status", default: "active", null: false
    t.string "emitter_name", null: false
    t.string "emitter_rfc", null: false
    t.string "receiver_name", null: false
    t.string "receiver_rfc", null: false
    t.integer "amount_cents", null: false
    t.string "amount_currency", limit: 3, null: false
    t.date "emitted_at", null: false
    t.date "expires_at"
    t.date "signed_at"
    t.text "cfdi_digital_stamp", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["amount_cents"], name: "index_invoices_on_amount_cents"
    t.index ["emitted_at"], name: "index_invoices_on_emitted_at"
    t.index ["emitter_rfc"], name: "index_invoices_on_emitter_rfc"
    t.index ["invoice_uuid"], name: "index_invoices_on_invoice_uuid", unique: true
    t.index ["receiver_rfc"], name: "index_invoices_on_receiver_rfc"
    t.index ["status"], name: "index_invoices_on_status"
  end

end
