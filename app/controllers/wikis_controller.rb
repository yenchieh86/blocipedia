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
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    @wiki.user = current_user

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
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]

    if @wiki.save
      flash[:notice] = "#{@wiki.title} is updated."
      redirect_to wiki_path(@wiki)
    else
      flash.now[:alert] = "Something is wrong, please try again."
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
end
