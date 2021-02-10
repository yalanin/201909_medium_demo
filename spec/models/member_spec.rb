require 'rails_helper'

RSpec.describe Member do
  # before do
  #   @member = Member.create(nickname: 'RSpec 測試', intro: '這是 RSpec 測試創造的 member')
  # end

  # def member
  #   Member.create(nickname: 'RSpec 測試', intro: '這是 RSpec 測試創造的 member')
  # end

  let(:member) { Member.create(nickname: 'RSpec 測試', intro: '這是 RSpec 測試創造的 member') }

  it 'should create a new member' do
    expect(member.nickname).to eq('RSpec 測試')
  end

  it 'should assign new value to intro' do
    member.intro = 'RSpec 測試更新'
    expect(member.intro).to eq('RSpec 測試更新')
  end

  it 'should has intro' do
    expect(member.intro).to eq('這是 RSpec 測試創造的 member')
  end

  it 'has custom error message' do
    comparison = '我希望變成這樣'
    expect(member.intro).to eq(comparison), "我希望結果是 #{comparison}，可是出現的是 #{member.intro}"
  end
end