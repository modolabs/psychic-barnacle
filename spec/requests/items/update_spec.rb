require 'rails_helper'

RSpec.describe 'Item creation' do
  let(:project) { Project.create! title: 'My Project' }
  let(:item) { project.items.create! action: 'Eat Pizza' }

  context 'when visiting the new page' do
    it 'will respond success' do
      get edit_project_item_path project, item

      expect(response).to have_http_status :ok
    end
  end

  context 'when creating a new project' do
    context 'with invalid params' do
      it 'will respond success' do
        patch project_item_path project, item, params: { item: { action: '' } }

        expect(flash[:alert]).to eq ["Action can't be blank"]
        expect(response).to have_http_status :ok
      end
    end

    context 'with valid params' do
      it 'will respond success' do
        patch project_item_path project, item, params: { item: { action: 'Drink Water' } }

        expect(flash[:notice]).to eq 'Item was successfully updated.'
        expect(item.reload.action).to eq 'Drink Water'
      end
    end

  end
end
