module RSpec
  module HaveReadonlyQueryMatcher
    module_function

    def enable!
      @enabled = true
    end

    def disable!
      @enabled = false
    end

    def enable?
      @enabled || false
    end

    module Readonlyable
      class NotReadonlyError < StandardError; end

      def execute(sql, name = nil)
        if RSpec::HaveReadonlyQueryMatcher.enable?
            if sql =~ /^(SELECT|SET|SHOW|DESCRIBE)\b/
              super sql, name
            else
              raise NotReadonlyError.new("#{name}: #{sql}")
            end
        else
            super sql, name
        end
      end
    end
  end
end
