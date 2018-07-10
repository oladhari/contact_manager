class Group < ApplicationRecord
  has_many :contacts
  validates :name, uniqueness: true, presence: true
end
