class Scaffold::UsersController < Scaffold::BaseController
  before_filter :require_admin_user
  
  active_scaffold :users do |config|
    # Columns
    config.columns = [:first_name, :last_name, :email, :account_type, :name]
    config.columns[:name].sort_by :sql => 'first_name || \' \' || last_name'
    
    # Listing
    config.list.columns = [:name, :email, :account_type]
    config.list.sorting = { :name => 'ASC' }
    
    # Exclude actions
    config.actions.exclude :show
    config.actions.exclude :search
    config.actions.exclude :create
  end
end