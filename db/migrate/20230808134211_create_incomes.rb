class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.references :user, foreign_key: true
      t.references :income_category, foreign_key: false
      t.float :amount, precision: 10, scale: 2, null: false
      t.date :date, null: false, index: true
      t.string :name, null: false
      t.boolean :deleted, default: false
      t.timestamps
    end
  end
end
