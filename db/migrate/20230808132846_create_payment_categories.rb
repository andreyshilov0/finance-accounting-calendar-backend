class CreatePaymentCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_categories do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :payment_categories, :name, unique: true
  end
end
