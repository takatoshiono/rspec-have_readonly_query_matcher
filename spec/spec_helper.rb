require "bundler/setup"
require "rspec/have_readonly_query_matcher"

module ActiveRecord
  module ConnectionAdapters
    class DummyAdapter
      def execute(sql, name = nil)
        { sql: sql, name: name }
      end
    end
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  RSpec::HaveReadonlyQueryMatcher.configure do |config|
    config.adapter = ActiveRecord::ConnectionAdapters::DummyAdapter
  end

  config.include RSpec::HaveReadonlyQueryMatcher
end
