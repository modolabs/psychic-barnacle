FactoryBot.define do
  factory :project do
    sequence(:title) {|n| "project_#{n}"}
  end
end
