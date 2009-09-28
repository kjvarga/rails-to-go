class Scaffold::UsersController < Scaffold::BaseController
  before_filter :require_admin_user
  
  active_scaffold :users do |config|
    config.columns = [:first_name, :last_name, :email, :account_type, :name]
    
    config.list.columns = [:name, :email, :account_type]
    config.list.sorting = { :name => 'ASC' }
    
    config.columns[:name].sort_by :sql => 'first_name || \' \' || last_name'
    config.actions.exclude :show
  end
end