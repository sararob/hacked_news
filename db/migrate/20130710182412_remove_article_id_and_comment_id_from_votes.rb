class RemoveArticleIdAndCommentIdFromVotes < ActiveRecord::Migration
  def up
  end

  def down
    remove_column(:votes, :comment_id, :article_id)
  end
end
