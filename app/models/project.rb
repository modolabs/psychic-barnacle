class Project < ActiveRecord::Base
  default_scope { where(deleted: false) }

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :deleted, inclusion: { in: [ true, false ] }
  has_many :items, dependent: :destroy
end
