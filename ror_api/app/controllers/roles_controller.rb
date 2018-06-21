class RolesController < ApplicationController

  before_action -> { authorize Role }
  before_action :set_role, only: [:update, :edit, :destroy]
  def index
  end

  def new
    @role = Role.new
    authorize @role
    @role
  end

  def create
    @role = Role.new(role_params)
    authorize @role

    if @role.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name)
  end
end
