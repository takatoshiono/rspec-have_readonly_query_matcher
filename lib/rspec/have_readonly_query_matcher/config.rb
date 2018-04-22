module RSpec
  module HaveReadonlyQueryMatcher
    class Config
      attr_reader :adapter

      def adapter=(adapter)
        @adapter = adapter
        prepend_readonlyable
      end

      private

      def prepend_readonlyable
        adapter_class.prepend(RSpec::HaveReadonlyQueryMatcher::Readonlyable)
      end

      def adapter_class
        case @adapter
        when Class
          @adapter
        else
          raise RSpec::HaveReadonlyQueryMatcher::Error, "Unexpected adapter: #{@adapter}"
        end
      end
    end
  end
end  
