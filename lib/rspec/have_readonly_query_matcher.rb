require "active_support/notifications"
require "active_record"

require "rspec/have_readonly_query_matcher/version"
require "rspec/have_readonly_query_matcher/have_readonly_query"

module RSpec
  module HaveReadonlyQueryMatcher
    def have_readonly_query
      HaveReadonlyQuery.new
    end
    alias_method :have_only_read_query, :have_readonly_query

    module_function
  end
end
