class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def new
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def edit
  end
end
