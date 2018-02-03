require 'integration_test_helper'

class ArticleFlowTest < ActionDispatch::IntegrationTest
  test "article creating" do
    get new_article_path, headers: auth_headers
    assert_response :success

    post articles_path,
      params: { article: { title: "can create", text: "article successfully." } },
      headers: auth_headers
    assert_response :redirect
    follow_redirect!
    assert_response :success

    article = Article.find_by title: "can create", text: "article successfully."
    assert { article.draft? }
    assert { article.present? }
  end

  test "article updating" do
    article = articles(:one)
    put article_path(article),
        params: {
          article: {
            title: "#{article.title} new",
            text: "#{article.text} new"
          }
        },
        headers: auth_headers
    assert_response :redirect
    follow_redirect!
    assert_response :success

    updated_article = Article.find_by id: article.id
    assert { updated_article.title == "#{article.title} new" }
    assert { updated_article.text == "#{article.text} new" }
  end

  test "article destroying" do
    article = articles(:one)

    delete article_path(article), headers: auth_headers
    assert_response :redirect
    follow_redirect!
    assert_response :success

    deleted_article = Article.find_by id: article.id
    assert { deleted_article.nil? }
  end
end
