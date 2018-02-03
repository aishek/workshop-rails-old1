require 'test_helper'

class Web::Articles::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test 'should like comment' do
    article = articles(:one)
    comment = article.comments.first

    assert_difference ->{ comment.likes.count }, 1 do
      post like_article_comment_url(article, comment)
    end
    assert_response :redirect
    follow_redirect!
    assert_response :success

    updated_article = Article.find(article.id)
    updated_comment = updated_article.comments.find(comment.id)
    assert { updated_article.likes_count = article.likes_count + 1 }
    assert { updated_comment.likes_count = comment.likes_count + 1 }
  end
end
