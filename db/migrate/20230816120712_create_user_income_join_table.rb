class CreateUserIncomeJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :income_categories do |t|
      t.index %i[user_id income_category_id], name: 'index_users_income_categories'
    end
  end
end
