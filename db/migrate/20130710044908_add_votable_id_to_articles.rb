class AddVotableIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :votable_id, :integer
  end
end
