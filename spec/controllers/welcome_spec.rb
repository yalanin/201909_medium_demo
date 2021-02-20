require 'rails_helper'
require 'shared/share_context.rb'
require 'shared/share_examples.rb'

RSpec.describe WelcomeController, type: :controller do
  # describe 'with welcome show page' do
  #   subject { ['<Story id: 4, title: "有圖片"', '<Story id: 5, title: "沒有圖">'] }
  #   include_examples 'Active Record result is 2'
  # end

  # describe 'with welcome show page' do
  #   subject { [ '<Comment id: 6, content: "留言測試"', '<Comment id: 7, member_id: 2, story_id: 4, content: "123"' ] }
  #   include_examples 'Active Record result is 2'
  # end

  # include_context 'Share Context'
  # it 'can use variable in share context' do
  #   expect(@comment.content).to eq('RSpec 共享測試')
  # end

  describe 'with welcom show page' do
    # let(:member) { double('double member', say_follow_me: 'follow me!') }
    let(:allow_member) { double('double member') }

    # it 'should do something with double method' do
    #   expect(member.say_follow_me).to eq('follow me!')
    # end

    # it 'should do something with allow..receive method' do
    #   allow(allow_member).to receive(:say_follow_me).and_return('follow me!')
    #   expect(allow_member.say_follow_me).to eq('follow me!')
    # end

    # it 'should do something with recieve message method' do
      # allow(allow_member).to receive_messages(say_follow_me: 'follow me!')
      # expect(allow_member.say_follow_me).to eq('follow me!')
    # end

    it 'can have multiple value with allow method' do
      allow(allow_member).to receive(:say_follow_me).and_return('follow me!', '按讚', nil, '訂閱分享')
      expect(allow_member.say_follow_me).to eq('follow me!')
      expect(allow_member.say_follow_me).to eq('按讚')
      expect(allow_member.say_follow_me).to be_nil
      expect(allow_member.say_follow_me).to eq('訂閱分享')
      expect(allow_member.say_follow_me).to eq('訂閱分享')
      expect(allow_member.say_follow_me).to eq('訂閱分享')
    end
  end
end