class CreateContestants < ActiveRecord::Migration
  def up
    create_table :contestants do |t|
      t.string :name

      t.timestamps null: false
    end
  end

  def down
    drop_table :contestants
  end
end
