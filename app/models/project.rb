class Project < ActiveRecord::Base
  validates :title, presence: true
  has_many :items, dependent: :destroy
end
