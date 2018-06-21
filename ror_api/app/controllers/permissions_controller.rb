class PermissionsController < ApplicationController

  before_action -> { authorize Permission }
  before_action :set_permission, only: [:update, :edit, :destroy]
  def index
  end

  def new
    @permission = Permission.new
    authorize @permission
    @permission
  end

  def create
    @permission = Permission.new(permission_params)
    authorize @permission

    if @permission.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def set_permission
    @permission = Permission.find(params[:id])
  end

  def permission_params
    params.require(:permission).permit(:name)
  end
end
