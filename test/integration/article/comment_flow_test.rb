require 'integration_test_helper'

class CommentFlowTest < ActionDispatch::IntegrationTest
  test "comment creating" do
    article = articles(:one)

    post article_comments_path(article),
      params: {
        comment: {
          commentor: 'stranger',
          body: 'wow'
        }
      }

    assert_response :redirect
    follow_redirect!
    assert_response :success

    comment = article.comments.find_by commentor: 'stranger', body: 'wow'
    assert { comment.present? }
  end

  test "comment destroying" do
    article = articles(:one)
    comment = article_comments(:one)

    delete article_comment_path(article, comment), headers: auth_headers
    assert_response :redirect
    follow_redirect!
    assert_response :success

    deleted_comment = article.comments.find_by id: comment.id
    assert { deleted_comment.nil? }
  end
end
