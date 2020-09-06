class SectionsController < ApplicationController
  before_action :confirm_logged_in
  before_action :find_page

  def index
    @section = @page.section.paginate(page: params[:page], per_page: 4).order("created_at asc")
  
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:page_id=>@page.id)
  end
  
  def create
    @section = Section.new(section_params)
    if(@section.save)
      flash[:notice]="section created succusfully"
      redirect_to(sections_path(:page_id=>@page.id))
    else
      render 'new'
    end
  end

  def edit
    @section = Section.find(params[:id])
  end
  
  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice]="Section Updated succusfully"
      redirect_to(sections_path(:page_id=>@page.id))
    else
      reder 'edit'
    end

  end

  def delete
    @section = Section.find(params[:id])
  end
  
  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to(sections_path(:page_id=>@page.id))
  end
  
  private
  
  def section_params
    params.require(:section).permit(:page_id,:name,:position,:visible,:content_type,:content)
  end
  def find_page
   @page = Page.find(params[:page_id])
  end


end
