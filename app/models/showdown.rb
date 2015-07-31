class Showdown < ActiveRecord::Base
  has_many :stats
  has_many :votes, through: :contestants
  has_and_belongs_to_many :contestants
end
