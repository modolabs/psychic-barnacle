require 'rails_helper'

RSpec.describe 'deleting Project objects' do
  let!(:project) { Project.create! title: 'My Project' }

  it 'will destroy the Project object' do
    expect do
      delete project_path project
    end.to change { Project.count }.by(-1)

    expect(response).to redirect_to projects_path
    expect(flash[:notice]).to eq 'Project was successfully destroyed.'
  end
end
