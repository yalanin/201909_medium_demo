RSpec.shared_context 'Share Context' do
  before do
    @comment = Comment.create(params)
  end

  def params
    { member_id: member.id, content: 'RSpec 共享測試' }
  end

  let(:member) { Member.create(nickname: 'RSpec 測試') }
end