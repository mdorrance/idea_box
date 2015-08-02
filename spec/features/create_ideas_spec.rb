require 'rails_helper'

feature "user creates new idea" do
  scenario 'user sees add idea form' do
    visit new_idea_path

    expect(page).to have_button 'Add Idea'
  end
  scenario 'user creates new idea' do
    visit new_user_path
    fill_in "Username", with: "miked"
    fill_in "Password", with: "1234"
    click_button "Join Idea Box"

    Category.create(name:"Home")
    Category.create(name:"Sport")
    Category.create(name:"Hobby")
    
    visit new_idea_path
    fill_in "Title", with: "Idea 1"
    fill_in "Description", with: "A great idea."
    select 'Hobby', from: "Category"
    click_button "Add Idea"

    expect(page).to have_content 'Idea 1'
  end

end
