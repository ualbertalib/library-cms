# frozen_string_literal: true

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
    flash[:success] = t(".admin_created_successfully")
    redirect_to action: :show, id: @admin
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = t(".admin_creation_failed")
    render action: :new
  end

  def update
    @admin.update!(admin_params)
    flash[:success] = t(".admin_updated_successfully")
    redirect_to action: :show, id: @admin
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = t(".admin_update_failed")
    render action: :edit
  end

  def destroy
    @admin.destroy
    flash[:success] = t(".admin_deleted_successfully")
    redirect_to action: :index
  end

  protected

  def build_admin
    @admin = Admin.new(admin_params)
  end

  def load_admin
    @admin = Admin.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = t("admin.admins.admin_not_found")
    redirect_to action: :index
  end

  def admin_params
    params.fetch(:admin, {}).permit(:email, :password)
  end
end
