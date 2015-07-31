class Contestant < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :large => '1000x1000', :medium => '600x600', :small => '300x300' }
  # validates_attachment_content_type :portrait, :content_type => /\Aimage\/.*\Z/ 

  has_many :contestant_stats, dependent: :destroy
  has_many :votes
  has_and_belongs_to_many :showdowns, through: :votes
end
