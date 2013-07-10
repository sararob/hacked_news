class Vote < ActiveRecord::Base
  attr_accessible :value

  belongs_to :votable, polymorphic: true
  belongs_to :user
end
