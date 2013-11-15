class ComicsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index, :search]
  load_and_authorize_resource

  ## CREATE
  ############################
  def new
  end

  def create
    # Treat author
    add_autors

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
    if params[:sort_by]
      case params[:sort_by]
        when 'titles'
          @comics = Comic.all.order(:title)
          render 'index'

        when 'authors'
          @authors = Author.all.order(:name)
          render 'index_sorted_by_authors'
        when 'collections'
          @collections = Collection.all.order(:title)
          render 'index_sorted_by_collections'
        else
          @comics = Comic.all.order(:title)
          render 'index'
      end
    end
  end

  def search

    search_str = params[:query]

    @result = Comic.search :load => {:include => 'authors'} do
      query do
        boolean do
          must   { string search_str }
        end
      end
    end


  end


  ## UPDATE
  ############################
  def edit
  end

  def update
    # Treat author
    add_autors

    if @comic.update_attributes(params[:comic])
      flash[:notice] = 'Successfully updated comic.'
      redirect_to comic_path(@comic)
    else
      render 'edit'
    end
  end




  private


  ## Utils
  ############################
  def autocomplete_author_name
    authors = Author.where('lower(name) LIKE ?', "%#{params[:name]}%")
    result = authors.collect do |a|
      { value: a.name }
    end
    render json: result
  end

  private
  def add_autors
    @comic.authors = []
    authors_as_str = params[:comic][:author_names].strip.end_with?(',') ? params[:comic][:author_names].strip[0..-2] : params[:comic][:author_names]
    authors_as_array = authors_as_str.split(",")
    authors_as_array.each do |author_name|
      author = Author.find_by_name(author_name.strip)
      if author.blank?
        author = Author.create(name: author_name.strip)
        author.save
      end

      @comic.authors << author

    end
  end

  private
  
  ## Strong parameters
  ############################
  def comic_params
    params.require(:comic).permit(:title, :author_names, :isbn, :cover, :cover_cache, :available  )
  end

end
