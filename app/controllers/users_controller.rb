class UsersController < ApplicationController

  def show
    @wikis = Wiki.where(user_id: current_user.id)
  end

  def downgrade
    @user = current_user
    wikis = Wiki.all

    current_user.standard!
    current_user.wikis.update_all(public: true)

    flash[:notice] = "Your account has been downgraded. You are now a Standard member."
    redirect_to users_show_path
  end
end
