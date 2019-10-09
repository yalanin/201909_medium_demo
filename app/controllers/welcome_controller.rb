class WelcomeController < ApplicationController
  def index
    @stories = Story.all.order(created_at: :desc).includes(:member)
  end

  def show
    @story = Story.friendly.find(params[:story_id])
    @is_author = if current_member == @story.member
                  true
                else
                  false
                end
  end

  def member
  end
end
