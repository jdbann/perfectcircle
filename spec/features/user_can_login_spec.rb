require "rails_helper"

RSpec.feature "user_can_login", type: :feature do
  scenario "user logs in" do
    create :user, email: "john@example.com", password: "password"

    visit new_user_session_path

    fill_in :user_email, with: "john@example.com"
    fill_in :user_password, with: "password"
    click_on "Sign in"

    expect(page).to have_text("Signed in successfully.")
  end
end
