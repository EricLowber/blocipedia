class WikisController < ApplicationController
  def index   

    user = current_user
      if params[:select]=="mywikis"
 
      else
        @wikis = policy_scope(Wiki)
        render 'allwikis'
    end
  end

  def new
    @wiki =Wiki.new
    authorize @wiki
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    @collaboration = Collaboration.new
  end

  def update_collaborators
       @wiki = Wiki.find(params[:id])  
       @users = User.all - [User == 'admin', current_user]
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:error] = "There was an error updating the wiki."
      render :edit
    end
  end

  def create
    @wiki = current_user.wikis.build(wiki_params)
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :new
    end 
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    name = @wiki.title
    if @wiki.destroy
      flash[:notice] =  "\"#{name}\" was deleted."
      redirect_to wikis_path
      else
      flash[:error] = "There was an error deleting the wiki."
      redirect_to @wiki
    end
  end

 
private

  def wiki_params 
    params.require(:wiki).permit(:title, :body, :private, :user_id, :user_ids => [])
  end
end

