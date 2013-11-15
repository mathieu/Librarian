class LoansController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def show
  end

  def index
  end

  def new
    if params[:item]
      @loan.item = Item.find(params[:item])
    else
      flash[:error] = 'Error while creating loan.'
    end
  end
  
  def create
    # Set the item availability
    @loan.item.available = false
    @loan.returned = false
    if @loan.save and @loan.item.save 
      flash[:notice] = 'Successfully created loan.'
      redirect_to comics_url
    else
      flash[:error] = 'Error while creating loan.'
      render 'new'
    end
  end

  def edit
    update
  end

  def update 
    @loan.returned = true
    @loan.item.available = true
    if @loan.save and @loan.item.save 
      flash[:notice] = 'Successfully returned loan.'
      redirect_to loans_url
    else
      flash[:error] = 'Error while returning loan.'
      render 'new'
    end
  end

  ## Strong parameters
  ############################
  def loan_params
    params.require(:loan).permit(:user_id, :item_id, :returned )
  end
end
