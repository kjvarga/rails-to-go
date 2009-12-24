module Scaffold
  module UsersHelper
    #
    # ActiveScaffold customizations
    #
    def account_type_form_column(record, input_name)
      types = User.account_types.collect { |t| [t.capitalize, t] }
      select :record, :account_type, types, { :include_blank => false }
    end
  
    def account_type_column(record)
      record.account_type.capitalize
    end
  end
end