class CreateContestantStats < ActiveRecord::Migration
  def up
    create_table :contestant_stats do |t|
      t.string :value

      t.timestamps null: false
    end
  end

  def down
    drop_table :contestant_stats
  end
end
