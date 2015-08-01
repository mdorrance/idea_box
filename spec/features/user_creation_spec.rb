require 'rails_helper'

feature "User creates an account" do
  scenario "sees join idea box form" do
    visit new_user_path
    expect(page).to have_button('Join Idea Box')
  end
  scenario "user submits valid form" do
    visit new_user_path
    fill_in "Username", with: "miked"
    fill_in "Password", with: "1234"
    click_button "Join Idea Box"

    current_path.should == ideas_path


  end

end
