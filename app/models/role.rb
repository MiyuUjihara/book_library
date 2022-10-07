class Role < ApplicationRecord
  has_many :users, through: :user_roles
  validates :name, presence: true
end