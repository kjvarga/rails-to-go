require File.dirname(__FILE__) + '/../spec_helper'
 
describe ServersController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Server.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Server.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Server.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(server_url(assigns[:server]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Server.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Server.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Server.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Server.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Server.first
    response.should redirect_to(server_url(assigns[:server]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    server = Server.first
    delete :destroy, :id => server
    response.should redirect_to(servers_url)
    Server.exists?(server.id).should be_false
  end
end
