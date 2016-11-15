class CollaboratorsController < ApplicationController
  def index
    @collaborators = Collaborator.all
    @wiki = Wiki.find(params[:wiki_id])
  end

  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new
  end
  
  def create
    @wiki = Wiki.find(params[:wiki_id])
    user = User.find_by(email: params[:collaborator][:user_id])
    
    if @wiki.users.include?(user)
      flash[:alert] = "This user is already a collaborator"
    else
      collaborator = Collaborator.new(user: user, wiki: @wiki)
      if collaborator.save
        flash[:notice] = "You just add a new collaborator"
        redirect_to wiki_collaborators_path(@wiki)
      else
        flash[:alert] = "Something wrong, please try again"
        render :new
      end
    end
  end
  
  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.find(params[:id])
    
    if @collaborator.destroy
      flash[:notice] = "collaborator was deleted"
      redirect_to wiki_collaborators_path(@wiki)
    else
      flash[:alert] = "collaborator couldn't be deleted. Try again."
      redirect_to :back
    end
  end
end