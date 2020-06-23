require 'rails_helper'

RSpec.describe 'Item creation' do
  let(:project) { Project.create! title: 'My Project' }
  context 'when visiting the new page' do
    it 'will respond success' do
      get new_project_item_path project

      expect(response).to have_http_status :ok
    end
  end

  context 'when creating a new project' do
    context 'with invalid params' do
      it 'will respond success' do
        expect do
          post project_items_path project, params: { item: { action: '' } }
        end.to change { Item.count }.by(0)

        expect(flash[:alert]).to eq ["Action can't be blank"]

        expect(response).to have_http_status :ok
      end
    end

    context 'with valid params' do
      it 'will respond success' do
        expect do
          post project_items_path project, params: { item: { action: 'Eat Pizza' } }
        end.to change { Item.count }.by(1)

        item = project.items.find_by action: 'Eat Pizza'

        expect(flash[:notice]).to eq 'Item was successfully created.'
        expect(item).not_to be_nil
      end
    end

  end
end
