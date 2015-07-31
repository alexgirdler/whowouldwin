class CreateShowdowns < ActiveRecord::Migration
  def up
    create_table :showdowns do |t|

      t.timestamps null: false
    end
  end

  def down
    drop_table :showdowns
  end
end
