class CreateIncomeCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :income_categories do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
