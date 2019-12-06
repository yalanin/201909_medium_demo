class WelcomeController < ApplicationController
  def index
    #可以直接用 AASM 的狀態設定抓 scope
    #ActiveStorage 要記得避免 SQL N+1
    # @stories = Story.published.with_attached_cover.order(created_at: :desc).includes(:member)
    @stories = Story.index_stories
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
