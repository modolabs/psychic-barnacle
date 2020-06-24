class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  has_many :items, dependent: :destroy
end
