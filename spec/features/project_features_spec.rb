require 'rails_helper'

describe "the project feature process" do
  it "adds a new project" do
    skill = FactoryGirl.create(:skill)
    visit skill_path(skill)
    click_on 'Add Project'
    fill_in 'Name', :with => 'Portfolio'
    fill_in 'Description', :with => 'Web app to display skills and projects'
    click_on 'Create Project'
    expect(page).to have_content 'Project successfully added!'
  end

  it "edits an existing project" do
    skill = FactoryGirl.create(:skill)
    visit skill_path(skill)
    click_on 'Add Project'
    fill_in 'Name', :with => 'Portfolio'
    fill_in 'Description', :with => 'Web app to display skills and projects'
    click_on 'Create Project'
    visit skill_path(skill)
    click_on 'Edit Project'
    fill_in 'Name', :with => 'StatsKeeper'
    fill_in 'Description', :with => 'Web app to track sports stats'
    click_on 'Update Project'
    expect(page).to have_content("Project successfully updated!")
  end

  it "deletes a project" do
    skill = FactoryGirl.create(:skill)
    visit skill_path(skill)
    click_on 'Add Project'
    fill_in 'Name', :with => 'Portfolio'
    fill_in 'Description', :with => 'Web app to display skills and projects'
    click_on 'Create Project'
    visit skill_path(skill)
    click_on "Delete Project"
    expect(page).to have_content("Project successfully deleted!")
  end

  it "gives an error when no name is entered" do
    skill = FactoryGirl.create(:skill)
    visit skill_path(skill)
    click_on 'Add Project'
    click_on 'Create Project'
    expect(page).to have_content 'errors'
  end
end
