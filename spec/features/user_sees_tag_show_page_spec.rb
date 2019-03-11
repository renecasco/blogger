require 'rails_helper'

describe 'user sees tag show page' do
  describe "they link from an article show page" do
    it "shows the tag show page" do

      article = Article.create!(title: "New Title", body: "New Body")
      tag = article.tags.create!(name: "Name")

      visit tag_path(tag)

      expect(page).to have_content(tag.name)
    end
  end
end
