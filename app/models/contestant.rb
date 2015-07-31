class Contestant < ActiveRecord::Base
  has_attachment :portrait
  # validates_attachment_content_type :portrait, :content_type => /\Aimage\/.*\Z/ 


  has_many :contestant_stats, dependent: :destroy
  has_many :votes
  has_and_belongs_to_many :showdowns, through: :votes

  def stat_for stat
    return contestant_stats.where(stat: stat).first
  end
end
