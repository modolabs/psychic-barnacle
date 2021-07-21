require 'rails_helper'

RSpec.feature 'Adds an item to the project' do
  describe 'Visit project, create a new item' do
    it 'Creates a new item' do
      project = create(:project)
      visit project_path(project)

      click_on('New Item')
      fill_in('Action', with: 'Do Something')
      click_on('Create Item')
      expect(Item.last.action).to eq('Do Something')
    end
  end
end
