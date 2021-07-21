require 'rails_helper'

RSpec.describe Project do
  subject { Project.new(params) }

  let(:params) {
    {
      :title => 'Some Big Project'
    }
  }

  describe "validations" do
    it "is valid with valid params" do
      expect(subject).to be_valid
    end

    it "requires a title" do
      params[:title] = ''

      expect(subject).to_not be_valid
      expect(subject.errors.keys).to eq [:title]
    end

    it 'title must be unique' do
      project1 = create(:project)
      not_unique_project = build(:project, title: project1.title)

      expect(not_unique_project.valid?).to be false
    end
  end
end
