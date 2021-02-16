require 'rails_helper'

RSpec.describe CommentsController, type: :controlller do
  describe 'with comment create action' do
    # let(:last_story) { Story.create(clap_counter: 100) }
    # let(:float) { 100.0 }
    # let(:int) { 100 }

    # it 'should match with each other' do
    #   expect(last_story.clap_counter).to eq(float)
    # end

    # it 'should not match with each other' do
    #   expect(last_story.clap_counter).not_to eql(float)
    # end

    # it 'should all pass' do
    #   expect(last_story.clap_counter).to eq(float)
    #   expect(last_story.clap_counter).to eq(int)
    #   expect(last_story.clap_counter).to eql(int)
    # end

    # describe 'eq，eql and equal metod' do
    #   let(:clap_counter) { [last_story.clap_counter] }
    #   let(:same_object) { clap_counter }
    #   it 'should equal with order id' do
    #     # expect(clap_counter).to equal([100])
    #     expect(clap_counter).to equal(same_object)
    #   end
    # end

    describe 'raise error matcher' do
      it 'will raise error message' do
        expect { 3 / 0 }.to raise_error(ZeroDivisionError)
      end
    end
  end
end