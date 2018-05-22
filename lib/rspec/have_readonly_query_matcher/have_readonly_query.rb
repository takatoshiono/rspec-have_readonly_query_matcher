module RSpec
  module HaveReadonlyQueryMatcher
    class HaveReadonlyQuery
      def matches?(given_proc)
        read_queries = []
        callback = lambda { |name, start, finish, id, payload|
          if payload[:sql] =~ /^(SELECT|SET|SHOW|DESCRIBE)\b/
            read_queries << true
          else
            read_queries << false
          end
        }

        ActiveSupport::Notifications.subscribed callback, 'sql.active_record' do
          given_proc.call
        end

        read_queries.all?
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
