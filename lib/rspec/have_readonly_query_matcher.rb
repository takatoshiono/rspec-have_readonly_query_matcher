require "rspec/have_readonly_query_matcher/version"
require "rspec/have_readonly_query_matcher/config"
require "rspec/have_readonly_query_matcher/have_readonly_query"
require "rspec/have_readonly_query_matcher/readonlyable"

module RSpec
  module HaveReadonlyQueryMatcher
    def have_readonly_query
      HaveReadonlyQuery.new
    end

    module_function

    def configure
      @config = Config.new
      yield @config
    end

    def enable!
      @enabled = true
    end

    def disable!
      @enabled = false
    end

    def enable?
      @enabled || false
    end
  end
end
