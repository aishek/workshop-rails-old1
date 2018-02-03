require 'test_helper'

class Moderation::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test 'should get index' do
    get moderation_articles_url
    assert_response :success
  end

  test 'should get edit' do
    get edit_moderation_article_url(@article)
    assert_response :success
  end

  test 'should update' do
    category = article_categories(:one)

    new_params = {
      'state' => 'published',
      'category_id' => category.id
    }
    patch moderation_article_url(@article), params: { article: new_params }
    assert_response :redirect
    follow_redirect!
    assert_response :success

    @article.reload

    assert { @article.attributes.slice('state', 'category_id') == new_params }
  end
end
