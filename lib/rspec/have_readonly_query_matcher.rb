require "rspec/have_readonly_query_matcher/version"

module RSpec
  module HaveReadonlyQueryMatcher
    def have_readonly_query
      HaveReadonlyQuery.new
    end

    class HaveReadonlyQuery
      def initialize
      end

      def matches?(given_proc)
        given_proc.call
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
