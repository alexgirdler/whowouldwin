class Vote < ActiveRecord::Base
  belongs_to :contestant
  belongs_to :showdown
end
