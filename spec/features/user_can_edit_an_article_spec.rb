require 'rails_helper'

describe "user edits an article" do
  describe "when a user visits an article's show page" do
    describe "they click on 'Edit'" do
      it "shows a form to edit the article" do
        article_1 = Article.create!(title: "Title 1", body: "Body 1")

        visit article_path(article_1)

        click_link "Edit"

        fill_in "article[title]", with: "New Title!"
        fill_in "article[body]", with: "New Body!"
        click_on "Update Article"

        expect(current_path).to eq(article_path(article_1))
        expect(page).to have_content("New Title!")
        expect(page).to have_content("New Body!")
      end
    end
  end
end
