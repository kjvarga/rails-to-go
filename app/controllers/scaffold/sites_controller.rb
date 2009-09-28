class Scaffold::SitesController < Scaffold::BaseController
  before_filter :require_admin_user
  
  active_scaffold :sites do |config|
    config.columns = [:domain, :domain_hash, :site_hash, :posts]
    config.list.sorting = {:domain => 'ASC'}
    config.list.columns = [:domain, :posts]
    config.actions.exclude :delete
    config.actions.exclude :show
  end
end