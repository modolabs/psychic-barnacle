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

    it "requires a unique title" do
      duplicate_title = 'My Chores'

      Project.create(title: duplicate_title)
      project = Project.new(title: duplicate_title)

      expect(project).to_not be_valid
      expect(project.errors.keys).to eq [:title]
    end
  end
end
