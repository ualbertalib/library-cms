class Admin::AdminsController < Comfy::Admin::BaseController
  before_action :build_admin, only: [:new, :create]
  before_action :load_admin, only: [:show, :edit, :update, :destroy]

  def index
    @admins = Admin.page(params[:page])
  end

  def show
    render
  end

  def new
    render
  end

  def edit
    render
  end

  def create
    @admin.save!
    flash[:success] = "Admin created"
    redirect_to action: :show, id: @admin
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = "Failed to create Admin"
    render action: :new
  end

  def update
    @admin.update!(admin_params)
    flash[:success] = "Admin updated"
    redirect_to action: :show, id: @admin
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = "Failed to update Admin"
    render action: :edit
  end

  def destroy
    @admin.destroy
    flash[:success] = "Admin deleted"
    redirect_to action: :index
  end

  protected

  def build_admin
    @admin = Admin.new(admin_params)
  end

  def load_admin
    @admin = Admin.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = "Admin not found"
    redirect_to action: :index
  end

  def admin_params
    params.fetch(:admin, {}).permit(:email, :password)
  end
end
