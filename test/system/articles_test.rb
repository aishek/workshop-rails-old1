require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit articles_path

    assert_selector "h1", text: "Articles"
  end

  test "creating an article" do
    visit articles_path

    click_on "New article"
    fill_in "Title", with: "Creating an Article"
    fill_in "Text", with: "Created this article successfully!"

    click_on "Create Article"

    assert_text "Title: Creating an Article"
    assert_text "Text: Created this article successfully!"
  end

  test "visiting an article" do
    article = articles(:one)
    visit article_path(article)

    assert_text "Title: title1"
    assert_text "Text: text1"
  end

  test "destroy an article" do
    visit articles_path

    assert_text "title1"
    assert_text "text1"

    click_on "Destroy"
    accept_confirm

    assert_no_text "title1"
    assert_no_text "text1"
  end

  test "update an article" do
    visit articles_path

    assert_text "title1"
    assert_text "text1"

    click_on "Edit"

    fill_in "Title", with: "Creating an Article"

    click_on "Update Article"

    assert_text "Title: Creating an Article"
  end
end
