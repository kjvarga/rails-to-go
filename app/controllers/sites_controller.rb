class SitesController < ApplicationController
  #layout :active_scaffold
  
  active_scaffold :sites do |config|
    #config.columns = [:name, :phone, :company_type, :comments]
    list.columns.exclude [:updated_at, :created_at]
    list.sorting = {:domain => 'ASC'}
  end
end

#class SitesController < ApplicationController
#  def index
#    @sites = Site.all
#  end
#  
#  def show
#    @site = Site.find(params[:id])
#  end
#  
#  def new
#    @site = Site.new
#  end
#  
#  def create
#    @site = Site.new(params[:site])
#    if @site.save
#      flash[:notice] = "Successfully created site."
#      redirect_to @site
#    else
#      render :action => 'new'
#    end
#  end
#  
#  def edit
#    @site = Site.find(params[:id])
#  end
#  
#  def update
#    @site = Site.find(params[:id])
#    if @site.update_attributes(params[:site])
#      flash[:notice] = "Successfully updated site."
#      redirect_to @site
#    else
#      render :action => 'edit'
#    end
#  end
#  
#  def destroy
#    @site = Site.find(params[:id])
#    @site.destroy
#    flash[:notice] = "Successfully destroyed site."
#    redirect_to sites_url
#  end
#end
