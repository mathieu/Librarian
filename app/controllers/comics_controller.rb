class ComicsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource

  ## CREATE
  ############################
  def new
  end

  def create
    # Set the registered date & and the availability
    @comic.registered = DateTime.now
    @comic.available = true
    if @comic.save
      flash[:notice] = 'Successfully created comic.'
      redirect_to comic_path(@comic)
    else
      render 'new'
    end
  end

  ## READ
  ############################
  def show
  end

  def index
    @comics = Comic.all
  end

  ## UPDATE
  ############################
  def edit
  end

  def update
    if @comic.update_attributes(params[:comic])
      flash[:notice] = 'Successfully updated comic.'
      redirect_to comic_path(@comic)
    else
      render 'edit'
    end
  end

  ## Strong parameters
  ############################
  def comic_params
    params.require(:comic).permit(:title, :author, :isbn)
  end

end
