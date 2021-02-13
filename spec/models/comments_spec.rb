require 'rails_helper'

RSpec.describe Comment do
# RSpec.describe Story do
  # context 'subject method' do
    # let(:comment) { Comment.create(content: 'RSpec 測試留言') }
    # it 'should run with subject method but fail' do
    #   expect(subject).to eq(Comment.new)
    # end

    # it 'should run with subject method' do
    #   subject.content = 'RSpec 測試留言'
    #   expect(subject.content).to eq(comment.content)
    # end
  # end

  # context 'descirbed class method' do
  #   subject { described_class.new(content: '主題文字1') }
  #   let(:comment) { described_class.new(content: '主題文字2') }

  #   it 'should have new subject comment' do
  #     expect(subject.content).to eq('主題文字1')
  #   end

  #   it 'should have new let comment' do
  #     expect(comment.content).to eq('主題文字2')
  #   end
  # end

  context 'one line syntax' do
    let(:comment) { described_class.new(content: '一行式語法測試') }
    subject { comment.content }
    it { is_expected.to eq('一行式語法測試') }
  end
end