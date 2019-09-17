class StoriesController < ApplicationController
  before_action :authenticate_member!

  def new
    @story = current_member.stories.new
    #debugger
  end

  def create
    @story = current_member.stories.new(story_params)

    if @story.save
      redirect_to stories_path, notice: '文章已儲存'
    else
      @error_message = @story.errors.full_messages
      render :new
    end
  end

  def index
  end

  private
  def story_params
    params.require(:story).permit(:title, :content)
  end
end
