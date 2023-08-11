class CreateIncomesUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :incomes, :users do |t|
      t.index %i[income_id user_id]
      t.index %i[user_id income_id]
    end
  end
end
