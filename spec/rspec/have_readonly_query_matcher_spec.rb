RSpec.describe RSpec::HaveReadonlyQueryMatcher do
  it "has a version number" do
    expect(RSpec::HaveReadonlyQueryMatcher::VERSION).not_to be nil
  end

  let(:connection) { ActiveRecord::ConnectionAdapters::DummyAdapter.new(nil) }

  describe '#have_readonly_query' do
    context 'when have only read queries' do
      subject do
        lambda {
          connection.execute "DESCRIBE users", "NAME"
          connection.execute "SELECT * FROM users", "NAME"
        }
      end

      it 'success' do
        expect { subject.call }.to have_readonly_query
        expect { subject.call }.to have_only_read_query
      end
    end

    context 'when have write queries' do
      subject do
        lambda {
          connection.execute "DESCRIBE users", "NAME"
          connection.execute "SELECT * FROM users", "NAME"
          connection.execute "INSERT INTO users VALUES(1, 'foo')", "NAME"
        }
      end

      it 'fail' do
        expect { subject.call }.not_to have_readonly_query
        expect { subject.call }.not_to have_only_read_query
      end
    end
  end
end
