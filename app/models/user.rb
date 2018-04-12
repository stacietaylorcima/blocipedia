class User < ApplicationRecord
  has_many :wikis
  has_many :collaborators, dependent: :destroy

  enum role: [:standard, :premium, :admin]
  # after_initialize { self.role ||= :standard }
  after_initialize do
    if self.new_record?
      self.role ||= :standard
    end
  end
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable
end
