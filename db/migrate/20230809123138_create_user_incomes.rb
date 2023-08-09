class CreateUserIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :user_incomes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :income, null: false, foreign_key: true
      t.float :amount, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
