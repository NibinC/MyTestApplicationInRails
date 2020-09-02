class AdminUsersController < ApplicationController
  before_action :confirm_logged_in
   def index
    @admins = AdminUser.all.order("created_at asc")
  end



  def new
    @admins = AdminUser.new
  end

  def create
    @admins = AdminUser.new(admins_params)
    if(@admins.save)
      flash[:notice]="Profile created successfully"
      redirect_to(admin_users_path)
    else
      render 'new'
    end
  end

  def edit
    @admin = AdminUser.find(params[:id])
  end

  def update
    @admin = AdminUser.find(params[:id])
    if(@admin.update_attributes(admins_params))
      flash[:notice]="Update Admin User #{@admin.username}"
      redirect_to(admin_users_path)
    else
      render 'edit'
    end

  end

  def delete
    @admin = AdminUser.find(params[:id])
  end

  def destroy

    @admin = AdminUser.find(params[:id])
    if @admin
      flash[:notice]="admin user #{@admin.username} deleted"
      @admin.destroy
      redirect_to(admin_users_path)
    else
      render 'delete'
    end

  end

  private
  def admins_params
    params.require(:admin_user).permit(:first_name,:last_name,:username,:password)
  end  
end


