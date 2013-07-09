class Article < ActiveRecord::Base
  attr_accessible :title, :url

  has_many :votes, as: :votable
  has_many :comments

  validates_presence_of :title, :url
  validates_uniqueness_of :url
  validates :url, :format => URI::regexp(%w(http https))
end
