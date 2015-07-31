class AddAttachmentPortraitToContestants < ActiveRecord::Migration
  def self.up
    change_table :contestants do |t|
      t.attachment :portrait
    end
  end

  def self.down
    remove_attachment :contestants, :portrait
  end
end
