class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :leader, foreign_key: false
      t.references :follower, foreign_key: false

      t.timestamps
    end
    # Got from Josh as RCC code did not work.
    # Similar to https://stackoverflow.com/questions/50614670/activerecordstatementinvalid-sqlite3sqlexception-no-such-table/50616320
    # It didn't work with the default migration. I add to move the FK
    # info here.
    add_foreign_key :subscriptions, :users, column: :leader_id
    add_foreign_key :subscriptions, :users, column: :follower_id
  end
end
