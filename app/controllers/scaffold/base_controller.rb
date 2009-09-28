class Scaffold::BaseController < ApplicationController
  #before_filter :require_user

  ActiveScaffold.set_defaults do |config| 
    config.ignore_columns.add [:created_at, :updated_at]
    config.list.per_page = 50
    config.actions << :nested
  end
end