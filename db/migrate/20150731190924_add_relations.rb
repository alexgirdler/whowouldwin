class AddRelations < ActiveRecord::Migration
  def change
    change_table :votes do |t|
      t.belongs_to :contestant, index: true
      t.belongs_to :showdown, index: true
    end

    # change_table :showdowns do |t|
      # t.has_many :stats, index: true
      # t.has_many :votes, index: true
      # t.has_many :contestants, index: true
    # end

    # change_table :contestants do |t|
      # t.has_many :contestant_stats, index: true
      # t.has_many :votes, index: true
      # t.has_many :showdowns, index: true
    # end

    change_table :contestant_stats do |t|
      t.belongs_to :contestant, index: true
      t.belongs_to :stat, index: true
    end

    change_table :stats do |t|
      t.belongs_to :showdown, index: true
    end

    create_table :contestants_showdowns, id: false do |t|
      t.belongs_to :showdown, index: true
      t.belongs_to :contestant, index: true
    end
  end
end
