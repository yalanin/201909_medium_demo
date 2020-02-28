class Api::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_login

  private
  def check_login
    unless member_signed_in?
      render json: {status: 'sign in first'}
      return
    end
  end
end
