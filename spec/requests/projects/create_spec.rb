require 'rails_helper'

RSpec.describe 'Project creation' do
  context 'when visiting the new page' do
    it 'will respond success' do
      get new_project_path

      expect(response).to have_http_status :ok
    end
  end

  context 'when creating a new project' do
    context 'with invalid params' do
      it 'will respond success' do
        expect do
          post projects_path, params: { project: { title: '' } }
        end.to change { Project.count }.by(0)

        expect(flash[:alert]).to eq ["Title can't be blank"]

        expect(response).to have_http_status :ok
      end
    end

    context 'with valid params' do
      it 'will respond success' do
        expect do
          post projects_path, params: { project: { title: 'My Project' } }
        end.to change { Project.count }.by(1)

        project = Project.find_by title: 'My Project'

        expect(flash[:notice]).to eq 'Project was successfully created.'
        expect(project.title).to eq 'My Project'
      end
    end

  end
end
