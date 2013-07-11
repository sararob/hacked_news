class Article < ActiveRecord::Base
  attr_accessible :title, :url, :user_id

  has_many :votes, as: :votable
  has_many :comments
  belongs_to :user

  validates_presence_of :title, :url
  validates_uniqueness_of :url
  validates :url, :format => URI::regexp(%w(http https))

  def num_votes
    self.votes.count
  end
end
