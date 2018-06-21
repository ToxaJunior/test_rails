class Test2Controller < ApplicationController

  before_action :authenticate_user!

  def index
    if @roles = current_user.roles
      @roles
    end
  end
end
