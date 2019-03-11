require 'rails_helper'

describe "user sees all tags" do
  describe "they visit tags" do
    it "displays all tags" do
      article = Article.create!(title: "New Title", body: "New Body")
      tag_1 = article.tags.create!(name: "Hello")
      tag_2 = article.tags.create!(name: "Goodbye")

      visit tags_path

      expect(page).to have_content(tag_1.name)
      expect(page).to have_content(tag_2.name)
    end
  end
end
