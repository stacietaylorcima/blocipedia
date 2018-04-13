class CollaboratorPolicy < ApplicationPolicy
  attr_reader :user, :collaborator

  def initialize(user, collaborator)
    @user = user
    @collaborator = collaborator
  end

  def create?
    (user.premium? && collaborator.owner == user) || user.admin?
  end

  def destroy?
    create?
  end
end
