class MoveArticleLikesCountInFavourOfArticleIdInLikes < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :likes_count, :integer, default: 0, null: false
    add_reference :article_comment_likes, :article, foreign_key: true
  end
end
