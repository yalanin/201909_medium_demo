class CommentsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_story, only: [:create]

  def create
    @comment = @story.comments.new(comment_params)
    @comment.member = current_member

    # if @comment.save
    #   render js: "alert('留言已儲存')"
    # else
    #   if comment_params[:content].empty?
    #     render js: "alert('留言內容不可空白')"
    #   else
    #     render js: "alert('系統異常，請稍後再試')"
    #   end
    # end

    # 留言改用 JS render
    unless @comment.save
      if comment_params[:content].empty?
        render js: "alert('留言內容不可空白')"
      else
        render js: "alert('系統異常，請稍後再試')"
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def set_story
    @story = Story.friendly.find(params[:story_id])
  end
end
