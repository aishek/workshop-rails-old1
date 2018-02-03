class CreateArticleCommentLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :article_comment_likes do |t|
      t.references :comment, foreign_key: true, null: false
      t.timestamps null: false
    end

    add_column :comments, :likes_count, :integer, default: 0, null: false
    add_column :articles, :likes_count, :integer, default: 0, null: false
  end
end
