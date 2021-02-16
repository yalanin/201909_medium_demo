require 'rails_helper'

RSpec.describe StoriesController, type: :controller do
  # before(:context) do
  #   puts 'this is OUTER before context'
  # end

  # after(:context) do
  #   puts 'this is OUTER after context'
  # end

  # before(:example) do
  #   puts 'this is OUTER before example'
  # end

  # after(:example) do
  #   puts 'this is OUTER after example'
  # end

  # let(:member) { Member.create(nickname: 'RSpec 測試', intro: '這是 RSpec 測試創造的 member') }
  # let(:stories) { member.stories }
  # let(:new_story) { member.stories.new(title: 'RSpec 相同變數測試 level 1') }

  # it 'should have top level title name' do
  #   expect(new_story.title).to eq('RSpec 相同變數測試 level 1')
  # end

  # describe 'with story index page' do
    # it 'should show all stories of member' do
    #   puts 'in the index test'
    #   Story.create(member_id: member.id, title: 'RSpec 測試')
    #   member_stories = Story.where(member_id: member.id)
    #   expect(member_stories).to eq(stories)
    # end

    # it 'should show current member nickname in page' do
    #   puts 'in the index show member test'
    #   expect(member.nickname).to eq ('RSpec 測試')
    # end

  #   describe 'task with all matcher' do
  #     let(:member) { Member.create(nickname: 'test') }
  #     let(:story1) { Story.create(member_id: member.id, title: 'all matcher test') }
  #     let(:story2) { Story.create(member_id: member.id, title: 'all matcher test') }
  #     let(:story3) { Story.create(member_id: member.id, title: 'all matcher test') }

  #     it 'test with all matcher' do
  #       expect([story1.title, story2.title, story3.title]).to all( eq('all matcher test') )
  #     end
  #   end
  # end

  # describe 'with story new page' do
    # before(:context) do
    #   puts 'this is INNER before context'
    # end

    # after(:context) do
    #   puts 'this is INNER after context'
    # end

    # before(:example) do
    #   puts 'this is INNER before example'
    # end

    # after(:example) do
    #   puts 'this is INNER after example'
    # end

  #   let(:new_story) { member.stories.new(title: 'RSpec 相同變數測試第二層') }

  #   it 'should build a new story instance' do
  #     # puts 'in the new story test'
  #     get :new
  #     expect(new_story).to be_a_new(Story)
  #   end

  #   it 'should change title of story without argument' do
  #     expect(new_story.title).to eq('RSpec 相同變數測試第二層')
  #   end
  # end

  describe 'with update page' do
    let(:story) { Story.create(title: 'change matcher', clap_counter: 100) }
    it 'should pass with change matcher' do
      expect { story.update(title: 'change matcher 測試') }.to change { story.title }.from('change matcher').to('change matcher 測試')
    end

    it 'should pass with by method if data is integer' do
      expect { story.update(clap_counter: 101) }.to change { story.clap_counter }.by(1)
    end
  end
end