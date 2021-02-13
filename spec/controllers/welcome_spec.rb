require 'rails_helper'
require 'shared/share_context.rb'
require 'shared/share_examples.rb'

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