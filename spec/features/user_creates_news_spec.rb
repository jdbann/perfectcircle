require "rails_helper"

RSpec.feature "user_creates_news", type: :feature do
  scenario "with title and body" do
    login_as create(:user)

    visit new_news_path

    fill_in :news_title, with: "Post title"
    fill_in :news_body, with: "Some body content."
    click_on "Create News"

    expect(page).to have_css("h1", text: "Post title")
  end
end
