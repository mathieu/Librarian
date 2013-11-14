class ComicsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource

  ## CREATE
  ############################
  def new
  end

  def create
    # Treat author
    authors_as_array = params[:comic][:author_names].gsub(/\s+/, "").split(";")
    authors_as_array.each do |author_name|
      author = Author.find_by_name(author_name)
      if author.blank?
        author = Author.create(name: author_name).save
      end
      unless @comic.authors.include?(author)
        @comic.authors << author
      end
    end

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
  end

  ## UPDATE
  ############################
  def edit
  end

  def update
    # Treat author
    authors_as_array = params[:comic][:author_names].gsub(/\s+/, "").split(";")
    authors_as_array.each do |author_name|
      author = Author.find_by_name(author_name)
      if author.blank?
        author = Author.create(name: author_name).save
      end
      unless @comic.authors.include?(author)
        @comic.authors << author
      end
    end

    if @comic.update_attributes(params[:comic])
      flash[:notice] = 'Successfully updated comic.'
      redirect_to comic_path(@comic)
    else
      render 'edit'
    end
  end


  ## Utils
  ############################
  def autocomplete_author_name
    authors = Author.where('lower(name) LIKE ?', "%#{params[:name]}%")
    result = authors.collect do |a|
      { value: a.name }
    end
    render json: result
  end

  ## Strong parameters
  ############################
  def comic_params
    params.require(:comic).permit(:title, :author_names, :isbn, :cover, :cover_cache, :available  )
  end

end
