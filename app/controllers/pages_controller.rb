class PagesController < ApplicationController
 before_action :confirm_logged_in
 before_action :find_subject
  def index
    @pages = @subject.page.paginate(page: params[:page], per_page: 4).order("position asc")
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(:subject_id=>@subject.id)
  end
  
  def create
    @page = Page.new(pages_params) 
    if(@page.save)
      flash[:notice]="Page created succussfully"
      redirect_to(pages_path(:subject_id=>@subject.id))
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
      redirect_to(pages_path(:subject_id=>@subject.id))
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
      redirect_to(pages_path(:subject_id=>@subject.id))
    else
      render('delete')
    end
  end
  private
  def pages_params
    params.require(:page).permit(:subject_id,:name,:permalink,:position,:visible)
  end
  def find_subject
    @subject = Subject.find(params[:subject_id])
  end  
end
