class CreateUserIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :user_incomes, id: false do |t|
      t.belongs_to :user
      t.belongs_to :income
    end
  end
end
