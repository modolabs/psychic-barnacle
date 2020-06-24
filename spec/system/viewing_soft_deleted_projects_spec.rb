require 'rails_helper'

RSpec.describe 'Viewing soft-deleted projects', type: :system do
  scenario 'Soft-deleted projects are hidden from view' do
    project = Project.create! title: 'My Project'
    deleted_project = Project.create! title: 'Deleted Project', deleted: true

    visit projects_path

    expect(page).to have_content(project.title)
    expect(page).to_not have_content(deleted_project.title)
  end
end
