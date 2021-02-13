RSpec.shared_examples 'Active Record result is 2' do
  it 'should have 2 subjects' do
    expect(subject.length).to eq(2)
  end
end