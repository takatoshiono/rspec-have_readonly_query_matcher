RSpec.describe RSpec::HaveReadonlyQueryMatcher do
  it "has a version number" do
    expect(RSpec::HaveReadonlyQueryMatcher::VERSION).not_to be nil
  end

  describe '#have_readonly_query' do
    context 'when have readonly queries' do
      it 'success'
    end

    context 'when have write queries' do
      it 'fail'
    end
  end
end
