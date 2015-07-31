class CreateVotes < ActiveRecord::Migration
  def up
    create_table :votes do |t|
      t.string :user

      t.timestamps null: false
    end
  end

  def down
    drop_table :votes
  end
end
