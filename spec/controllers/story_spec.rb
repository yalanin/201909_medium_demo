require 'rails_helper'

RSpec.describe 'GET #index' do
  before(:context) do
    puts 'this is before context'
  end

  after(:context) do
    puts 'this is after context'
  end

  before(:example) do
    puts 'this is before example'
  end

  after(:example) do
    puts 'this is after example'
  end

  let(:member) { Member.create(nickname: 'RSpec 測試', intro: '這是 RSpec 測試創造的 member') }
  let(:stories) { member.stories }
  let(:new_story) { member.stories.new }

  describe 'with story index page' do
    it 'should show all stories of member' do
      puts 'in the index test'
      Story.create(member_id: member.id, title: 'RSpec 測試')
      member_stories = Story.where(member_id: member.id)
      expect(member_stories).to eq(stories)
    end

    it 'should show current member nickname in page' do
      puts 'in the index show member test'
      expect(member.nickname).to eq ('RSpec 測試')
    end
  end
end