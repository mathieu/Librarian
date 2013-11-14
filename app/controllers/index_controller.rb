class IndexController < ApplicationController

  def index
    redirect_to comics_url
  end
end
