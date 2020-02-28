class Api::MembersController < Api::BaseController
  before_action :find_member

  def follow
    render json: {status: current_member.follow!(@member)}
  end

  private
  def find_member
    @member = Member.find(params[:id])
  end
end
