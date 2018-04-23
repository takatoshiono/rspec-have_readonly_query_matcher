module RSpec
  module HaveReadonlyQueryMatcher
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

      def description
        "have only read queries"
      end

      def failure_message
        "expected have only read queries"
      end

      def failure_message_when_negated
        "expected not have only read queries"
      end

      def supports_block_expectations?
        true
      end
    end
  end
end
