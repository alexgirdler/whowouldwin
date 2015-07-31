class CreateStats < ActiveRecord::Migration
  def up
    create_table :stats do |t|
      t.string :description

      t.timestamps null: false
    end
  end

  def down
    drop_table :stats
  end
end
