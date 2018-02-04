require 'test_helper'

class Web::Articles::Comments::LikesControllerTest < ActionDispatch::IntegrationTest
  test 'should create like' do
    article = articles(:one)
    comment = article.comments.first

    assert_difference ->{ article.likes.count }, 1 do
      assert_difference ->{ comment.likes.count }, 1 do
        post article_comment_likes_url(article, comment)
      end
    end
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
