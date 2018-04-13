class CollaboratorsController < ApplicationController
  def create
    wiki = Wiki.find(params[:wiki_id])
    user = User.find_by email: params[:collaborator][:user]

    collaborator = wiki.collaborators.build(user: user)

    if wiki.collaborators.find_by_user_id(user)
      flash[:alert] = "This user is already a collaborator."
      redirect_to edit_wiki_path(wiki) and return
    end

    if collaborator.save
      flash[:notice] = "Collaborator was added!"
    else
      flash[:danger] = "There was an error adding the collaborator. Please try again."
    end

    redirect_to edit_wiki_path(wiki)
  end

  def destroy
    wiki = Wiki.find(params[:wiki_id])
    collaborator = wiki.collaborators.find(params[:id])

    if collaborator.destroy
      flash[:notice] = "Collaborator was removed from this wiki."
    else
      flash[:danger] = "There was an error removing the collaborator. Please try again."
    end

    redirect_to edit_wiki_path(wiki)
  end
end
