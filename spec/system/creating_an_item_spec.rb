require 'rails_helper'

RSpec.describe 'Creating an item', type: :system do
  let(:project) { Project.create! title: 'My Project' }
  let(:item) { Item.new action: 'Complete Modo Labs assignment' }
  scenario 'Creating a valid item' do
    visit project_path(project.id)

    click_link 'New Item'
    fill_in "Action", with: item.action
    click_button "Create Item"

    expect(page).to have_content(item.action)
  end
end
