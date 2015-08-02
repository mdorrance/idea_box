require 'rails_helper'

feature "User creates an account" do
  scenario "sees join idea box form" do
    visit new_user_path
    expect(page).to have_button('Join Idea Box')
  end
  scenario "user submits valid form" do
    user = (visit new_user_path
           fill_in "Username", with: "miked"
           fill_in "Password", with: "1234"
           click_button "Join Idea Box")

    expect(page).to have_content('Welcome miked')
  end
end

feature "user can login/logout with valid username and password" do
  scenario "User logins successfully" do
    User.create(username: "miked", password: "1234")

    visit login_path
    fill_in "Username", with: "miked"
    fill_in "Password", with: "1234"
    click_button "Login"

    expect(page).to have_content('Welcome, miked!')
  end

  scenario "user can logout" do
    User.create(username: "miked", password: "1234")

    visit login_path
    fill_in "Username", with: "miked"
    fill_in "Password", with: "1234"
    click_button "Login"

    expect(page).to have_content('Welcome, miked!')
    click_link 'Logout'

    expect(page).to have_content 'Welcome to Idea Box'
  end
end
