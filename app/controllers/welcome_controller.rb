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
    @member = Member.find_by(nickname: params[:membername]) || Member.find_by("email LIKE?", "%#{params[:membername]}%")
    @last_stories = @member.stories.is_published.order(created_at: :desc).limit(10)
    @is_owner = if current_member == @member
                  true
                else
                  false
                end
  end
end
