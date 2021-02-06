require 'rails_helper'

RSpec.describe Member do
  it 'should create a new member' do
    member = Member.create(nickname: 'RSpec 測試')
    expect(member.nickname).to eq('RSpec 測試')
  end
end