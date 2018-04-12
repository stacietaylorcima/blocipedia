class CollaboratorsController < ApplicationController
  def new
    @collaborator = Collaborator.new
  end

  def create
    @collaborator = Collaborator.new(wiki_id: the id of the wiki the user was on when they clicked the add collaborator button, user_id: the id associated with the email that gets input in the new collaborator form.)
    @wiki = the wiki the user was on before they clicked the new collaborator button
    if @collaborator.save
      flash[:notice] = "Collaborator was added!"
      redirect_to @wiki
    else
      flash[:alert] = "There was an error adding the collaborator. Please try again."
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:wiki_id, :user_id])
    @wiki = the wiki the user was on before they clicked the new collaborator button

    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed from this wiki."
      redirect_to @wiki
    else
      flash[:error] = "Collaborator was not removed. Please try again."
    end
  end
end
