require 'rails_helper'

RSpec.shared_examples 'Active Record result is 2' do
  it 'should have 2 subjects' do
    expect(subject.length).to eq(2)
  end
end

RSpec.shared_context 'Share Context' do
  before do
    @comment = Comment.create(params)
  end

  def params
    { member_id: member.id, content: 'RSpec 共享測試' }
  end

  let(:member) { Member.create(nickname: 'RSpec 測試') }
end

RSpec.describe WelcomeController, type: :controller do
  describe 'with welcome show page' do
    subject { ['<Story id: 4, title: "有圖片"', '<Story id: 5, title: "沒有圖">'] }
    include_examples 'Active Record result is 2'
  end

  describe 'with welcome show page' do
    subject { [ '<Comment id: 6, content: "留言測試"', '<Comment id: 7, member_id: 2, story_id: 4, content: "123"' ] }
    include_examples 'Active Record result is 2'
  end

  include_context 'Share Context'
  it 'can use variable in share context' do
    expect(@comment.content).to eq('RSpec 共享測試')
  end
end