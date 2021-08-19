FactoryBot.define do
  factory :item do
    project
    action { 'Say Hello, World.'}
    done { false }
  end
end
