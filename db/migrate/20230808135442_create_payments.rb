class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :payment_category, foreign_key: true
      t.float :amount, precision: 10, scale: 2, null: false
      t.date :date, null: false
      t.string :name, null: false
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
