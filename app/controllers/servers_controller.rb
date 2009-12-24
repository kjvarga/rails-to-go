class ServersController < ApplicationController
  before_filter :require_admin_user

  def index
    show
  end
  
  def show
    @server = Server.first
  end
  
  def edit
    @server = Server.first
  end
  
  def update
    @server = Server.first
    if @server.update_attributes(params[:server])
      flash[:notice] = "Successfully updated server."
      redirect_to server_path
    else
      render :action => 'edit'
    end
  end
end
