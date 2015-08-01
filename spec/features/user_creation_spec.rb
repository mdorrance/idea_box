require 'rails_helper'

feature "User creates an account" do
  scenario "sees join idea box form" do
    visit new_user_path
    expect(page).to have_content('Join Idea Box')
  end

end
