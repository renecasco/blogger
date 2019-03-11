require 'rails_helper'

describe "user deletes a tag" do
  describe "they link from the show page" do
    it "displays all tags except for the deleted one" do
      article = Article.create!(title: "New Title", body: "New Body")
      tag_1 = article.tags.create!(name: "Hello")
      tag_2 = article.tags.create!(name: "Goodbye")

      visit tag_path(tag_1)
      click_link "Delete"

      expect(current_path).to eq(tags_path)
      expect(page).to have_content(tag_2.name)
      expect(page).to_not have_content(tag_1.name)
    end
  end
end
