class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators, dependent: :destroy
  has_many :users, through: :collaborators

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
end
