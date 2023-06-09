require 'rails_helper'

RSpec.describe "Projects", type: :system do
  # before do
  #   driven_by(:rack_test)
  # end

  #ユーザーは新しいプロジェクトを作成
  scenario "user create a new project" do
    user = FactoryBot.create(:user)
    #rails_helperにDeviseのヘルパーメソッドをテスト内で使用する記述を記載したため不要
    # visit root_path
    # click_link "Sign in"
    # fill_in "Email", with: user.email
    # fill_in "Password", with: user.password
    # click_button "Log in"
    save_and_open_page
    sign_in user
    visit root_path

    expect{
      click_link "New Project"
      fill_in "Name", with: "Test Project"
      fill_in "Description", with: "Trying out Capybara"
      click_button "Create Project"

      expect(page).to have_content "Project was successfully created"
      expect(page).to have_content "Test Project"
      expect(page).to have_content "Owner: #{user.name}"
    }.to change(user.projects, :count).by(1)
  end

  scenario "guest adds a project" do
    user = FactoryBot.create(:user)
    sign_in user
    visit projects_path
    save_and_open_page
    click_link "New Project"
  end

  scenario "guest adds a project", js: true do
    user = FactoryBot.create(:user)
    sign_in user
    visit projects_path
    click_link "New Project"
  end
end
