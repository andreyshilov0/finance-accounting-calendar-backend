class CreateUserPaymentJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :payment_categories do |t|
      t.index %i[user_id payment_category_id], name: 'index_users_payment_categories'
    end
  end
end
