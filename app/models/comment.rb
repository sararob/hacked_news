class Comment < ActiveRecord::Base
  attr_accessible :text

  has_many :votes, as: :votable
  belongs_to :article

  validates_presence_of :text
end
