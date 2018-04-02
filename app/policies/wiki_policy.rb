class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve # resolve method acts as a filter for the wikis
      public_wikis = scope.where(private: false)

      if user.nil?
        public_wikis # if the user is a guest to the site and has no user role, it will return nil. In that case, show all public wikis.
      elsif user.try(:admin?)
        scope.all # if the user is an admin, show all wikis (public and private)
      elsif user.try(:premium?)
        private_wikis_owned_by_user = scope.where(user: user, private: true)

        public_wikis.or(private_wikis_owned_by_user) # if the user is a premium user, show all public wikis and all private wikis that user created.
      else
        public_wikis #if the user is not a guest, admin, or premium user, they will be a standard user. In that case, show all public wikis.
      end
    end
  end

  # Policy Rules

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def make_private?
    user.role == 'premium' || user.role == 'admin'
  end

  def edit
    user.present?
  end

  def update?
    user.present?
  end

  def destroy?
    user.role == 'admin' || record.user == user
  end
end
