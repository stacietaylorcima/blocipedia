class WikiPolicy < ApplicationPolicy
  def index
    user.present?
  end

  def show
    user.present?
  end

  def new
    user.present?
  end

  def create
    user.present?
  end

  def make_private?
    user.role == 'premium' || user.role == 'admin'
  end

  def edit
    user.present?
  end

  def update
    user.present?
  end

  def destroy?
    user.role == 'admin' || record.user == user
  end
end
