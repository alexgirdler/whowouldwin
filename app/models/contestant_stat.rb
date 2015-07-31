class ContestantStat < ActiveRecord::Base
  belongs_to :contestant 
  belongs_to :stat
end
