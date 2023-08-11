class CreatePaymentsUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :payments, :users do |t|
      t.index %i[payment_id user_id]
      t.index %i[user_id payment_id]
    end
  end
end
