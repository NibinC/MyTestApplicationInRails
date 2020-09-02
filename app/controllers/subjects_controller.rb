class SubjectsController < ApplicationController
  
  before_action :confirm_logged_in

  def index
   # @subjects = Subject.all.order("position asc")
   @subjects = Subject.paginate(page: params[:page], per_page: 4)
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subjects = Subject.new
  end

  def create
    @subjects = Subject.new(subjects_params)
 
    if @subjects.save
      flash[:notice]="Your subject saved successfully"  
       redirect_to(subjects_path)
      
    else
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    
     if(@subject.update_attributes(subjects_params))

      flash[:notice]="Your Subject Updated Successfully"
      redirect_to(subjects_path)
    else
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
     @subject = Subject.find(params[:id])
    if @subject
      @subject.destroy

      flash[:notice]="Your Subject Deleted Successfully"
      redirect_to(subjects_path)
    else
      render('delete')
    end
  end
  
  private
   def subjects_params
    params.require(:subject).permit(:name,:position,:visible)
  end

end
