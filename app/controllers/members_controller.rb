class MembersController < ApplicationController
  before_action :find_member
  skip_before_action :verify_authenticity_token, only: [:follow]

  def follow
    if member_signed_in?
      render json: {status: current_member.follow!(@member)}
    else
      render json: {status: 'error'}
    end
  end

  private
  def find_member
    @member = Member.find(params[:id])
  end
end
