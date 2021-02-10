require 'rails_helper'

RSpec.describe 'GET #index' do
  let(:member) { Member.create(nickname: 'RSpec 測試', intro: '這是 RSpec 測試創造的 member') }
  let(:stories) { member.stories }
  let(:lala) { member.stories.last }

  describe 'with story index page' do
    it 'should show all stories of member' do
      Story.create(member_id: member.id, title: 'RSpec 測試')
      member_stories = Story.where(member_id: member.id)
      expect(member_stories).to eq(stories)
    end
  end
end