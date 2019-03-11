require 'rails_helper'

describe "user deletes an article" do
  describe "they link from the show page" do
    it "displays all articles except for the deleted one" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit article_path(article_1)
      click_link "Delete"

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_2.title)
      expect(page).to have_content("Article 'Title 1' Deleted!")
    end
  end
end
