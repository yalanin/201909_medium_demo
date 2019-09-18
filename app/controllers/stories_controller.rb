class StoriesController < ApplicationController
  before_action :authenticate_member!
  before_action :find_story, only: [:edit, :update, :destroy]

  def new
    @story = current_member.stories.new
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
    @stories = current_member.stories.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @story.update(story_params)
      redirect_to stories_path, notice: '文章已儲存'
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def story_params
    params.require(:story).permit(:title, :content)
  end

  def find_story
    @story = current_member.stories.find(params[:id])
  end
end
