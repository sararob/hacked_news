class RemoveUserIdFromArticles < ActiveRecord::Migration
  def up
  end

  def down
    remove_column :articles, :user_id
  end
end
