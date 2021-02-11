require 'rails_helper'

RSpec.describe StoriesController, type: :controller do
  before(:context) do
    puts 'this is OUTER before context'
  end

  after(:context) do
    puts 'this is OUTER after context'
  end

  before(:example) do
    puts 'this is OUTER before example'
  end

  after(:example) do
    puts 'this is OUTER after example'
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

  describe 'with story new page' do
    before(:context) do
      puts 'this is INNER before context'
    end

    after(:context) do
      puts 'this is INNER after context'
    end

    before(:example) do
      puts 'this is INNER before example'
    end

    after(:example) do
      puts 'this is INNER after example'
    end

    it 'should build a new story instance' do
      puts 'in the new story test'
      get :new
      expect(new_story).to be_a_new(Story)
    end
  end
end