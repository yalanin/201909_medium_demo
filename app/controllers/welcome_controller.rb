class WelcomeController < ApplicationController
  def index
    @stories = Story.all.order(created_at: :desc).includes(:member)
  end

  def show
  end

  def member
  end
end
