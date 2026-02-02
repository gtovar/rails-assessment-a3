class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :invoice_uuid, null: false
      t.string :status, null: false, default: "active"
      t.string :emitter_name, null: false
      t.string :emitter_rfc, null: false
      t.string :receiver_name, null: false
      t.string :receiver_rfc, null: false
      t.integer :amount_cents, null: false
      t.string :amount_currency, null: false, limit: 3
      t.date :emitted_at, null: false
      t.date :expires_at
      t.date :signed_at
      t.text :cfdi_digital_stamp, null: false

      t.timestamps
    end

    add_index :invoices, :invoice_uuid, unique: true
    add_index :invoices, :status
    add_index :invoices, :emitter_rfc
    add_index :invoices, :receiver_rfc
    add_index :invoices, :amount_cents
    add_index :invoices, :emitted_at
  end
end
