require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  test "creating a comment" do
    article = articles(:one)
    visit article_path(article)

    assert_text "Add a comment"

    fill_in "Commentor", with: "stranger"
    fill_in "Body", with: "wow"

    click_on "Create Comment"

    assert_text "Commentor: stranger"
    assert_text "Comment: wow"
  end

  test "destroy a comment" do
    article = articles(:one)
    visit article_path(article)

    assert_text "Commentor: MyString"
    assert_text "Comment: MyText"

    click_on "Delete comment"
    accept_confirm

    assert_no_text "Commentor: MyString"
    assert_no_text "Comment: MyText"
  end
end
