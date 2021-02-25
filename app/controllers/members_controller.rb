class MembersController < ApplicationController
  def pricing
  end

  def payment
    @fee = ENV["price_#{params[:type]}"]
    @payment_type = I18n.t("price_#{params[:type]}")
  end
end
