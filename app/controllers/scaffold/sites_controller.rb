class Scaffold::SitesController < Scaffold::BaseController
  before_filter :require_admin_user
  
  active_scaffold :sites do |config|
    config.columns = [:domain, :domain_hash, :site_hash]
    list.sorting = {:domain => 'ASC'}
    list.columns = [:domain, :posts]
    config.actions.exclude :delete
    
    config.nested.add_link("Show Posts", [:posts])
  end
end