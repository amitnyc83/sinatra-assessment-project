class Team < ActiveRecord::Base
  belongs_to :owner
  has_many :players
end
