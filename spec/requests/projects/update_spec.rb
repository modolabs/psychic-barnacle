require 'rails_helper'

RSpec.describe 'updating Project objects' do
  let(:project) { Project.create! title: 'My Project' }

  context 'when visiting the edit page' do
    it 'will respond success' do
      get edit_project_path project.id

      expect(response).to have_http_status :ok
    end
  end

  context 'when creating a new project' do
    context 'with invalid params' do
      it 'will respond success' do
        patch project_path project, params: { project: { title: '' } }

        expect(flash[:alert]).to eq ["Title can't be blank"]

        expect(response).to have_http_status :ok
      end
    end

    context 'with valid params' do
      it 'will respond success' do
        patch project_path project, params: { project: { title: 'My Cool Project' } }

        expect(project.reload.title).to eq 'My Cool Project'
      end
    end

  end
end
