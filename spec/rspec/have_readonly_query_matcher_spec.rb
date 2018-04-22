RSpec.describe RSpec::HaveReadonlyQueryMatcher do
  it "has a version number" do
    expect(RSpec::HaveReadonlyQueryMatcher::VERSION).not_to be nil
  end

  module ::ActiveRecord
    module ConnectionAdapters
      class DummyAdapter
        def execute(sql, name = nil)
          { sql: sql, name: name }
        end
      end
    end
  end

  ::ActiveRecord::ConnectionAdapters::DummyAdapter.prepend(RSpec::HaveReadonlyQueryMatcher::Readonlyable)

  let(:connection) { ::ActiveRecord::ConnectionAdapters::DummyAdapter.new }

  describe '#have_readonly_query' do
    context 'when have only read queries' do
      subject do
        connection.execute "DESCRIBE users", "NAME"
        connection.execute "SELECT * FROM users", "NAME"
      end

      it 'success' do
        expect { subject }.to have_readonly_query
      end
    end

    context 'when have write queries' do
      subject do
        connection.execute "DESCRIBE users", "NAME"
        connection.execute "SELECT * FROM users", "NAME"
        connection.execute "INSERT INTO users VALUES(1, 'foo')", "NAME"
      end

      it 'fail' do
        expect { subject }.not_to have_readonly_query
      end
    end
  end
end
