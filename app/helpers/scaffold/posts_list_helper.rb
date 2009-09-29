module Scaffold
  module PostsListHelper
    #
    # ActiveScaffold customizations
    #
    def created_at_column(record)
      time_ago_in_words(record.created_at) + ' ago'
    end
  end
end