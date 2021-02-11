require 'rails_helper'

RSpec.describe Comment do
  let(:comment) { Comment.create(content: 'RSpec 測試留言') }

  it 'should run with subject method but fail' do
    expect(subject).to eq(Comment.new)
  end

  it 'should run with subject method' do
    subject.content = 'RSpec 測試留言'
    expect(subject.content).to eq(comment.content)
  end
end