class PagesController < ApplicationController
 before_action :confirm_logged_in
  def index
    @pages = Page.all.order("position asc")
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(pages_params)
    if(@page.save)
      flash[:notice]="Page created succussfully"
      redirect_to(pages_path)
    else
      render('new')
    end
  end

  def edit
  @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    if(@page.update_attributes(pages_params))
      flash[:notice]="Page Updated succussfully"
      redirect_to(pages_path)
    else
      render('edit')
    end

  end

  def delete
    @page = Page.find(params[:id])
  end
  
  def destroy
    @page = Page.find(params[:id])
    if(@page)
      @page.destroy
      flash[:notice]="Page deleted succussfully"
      redirect_to(pages_path)
    else
      render('delete')
    end
  end
  private
  def pages_params
    params.require(:page).permit(:subject_id,:name,:permalink,:position,:visible)
  end

end
