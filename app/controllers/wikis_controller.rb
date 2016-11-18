class WikisController < ApplicationController

  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = current_user.wikis.new(wiki_params)

    if @wiki.save
      flash[:notice] = "You created a new wiki."
      redirect_to wiki_path(@wiki)
    else
      flash[:alert] = "Something is wrong, please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update(wiki_params)
      flash[:notice] = "#{@wiki.title} is updated."
      redirect_to wiki_path(@wiki)
    else
      flash[:alert] = "Something is wrong, please try again."
      render :show
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "#{@wiki.title} is deleted."
      redirect_to action: :index
    else
      flash.now[:alert] = "Something is wrong, please try again."
      redirect_to wiki_path
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
