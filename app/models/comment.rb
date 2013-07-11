class Comment < ActiveRecord::Base
  attr_accessible :text, :user_id, :article_id

  has_many :votes, as: :votable
  belongs_to :article
  belongs_to :user

  validates_presence_of :text

  def comment_votes
    self.votes.count
  end
end
