require "rspec/have_readonly_query_matcher/version"
require "rspec/have_readonly_query_matcher/readonlyable"

module RSpec
  module HaveReadonlyQueryMatcher
    def have_readonly_query
      HaveReadonlyQuery.new
    end

    class HaveReadonlyQuery
      def matches?(given_proc)
        begin
          RSpec::HaveReadonlyQueryMatcher.enable!
          given_proc.call
        rescue RSpec::HaveReadonlyQueryMatcher::Readonlyable::NotReadonlyError => e
          return false
        ensure
          RSpec::HaveReadonlyQueryMatcher.disable!
        end
        true
      end

      def failure_message
        "expected have readonly queries"
      end

      def failure_message_when_negated
        "expected not have readonly queries"
      end

      def supports_block_expectations?
        true
      end
    end
  end
end
