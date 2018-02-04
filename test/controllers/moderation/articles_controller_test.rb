require 'test_helper'

class Moderation::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get moderation_articles_url
    assert_response :success
  end

  test 'should get edit' do
    article = articles(:one)
    get edit_moderation_article_url(article)
    assert_response :success
  end

  test 'should update' do
    article = articles(:moderation)
    category = article_categories(:one)

    put moderation_article_url(article),
        params: {
          article: {
            state_event: 'publish',
            category_id: category.id
          }
        }
    assert_response :redirect
    follow_redirect!
    assert_response :success

    assert { article.reload.category == category }
    assert { article.published? }
  end
end
