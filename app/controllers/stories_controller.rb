class StoriesController < ApplicationController
  before_action :authenticate_member!, except: :show
  before_action :find_story, only: [:edit, :update, :destroy]

  def new
    @story = current_member.stories.new
  end

  def create
    @story = current_member.stories.new(story_params)
    @story.publish! if params[:publish]

    if @story.save
      if params[:publish]
        redirect_to stories_path, notice: '文章已發佈'
      else
        redirect_to edit_story_path(@story), notice: '草稿已儲存'
      end
    else
      @error_message = @story.errors.full_messages
      render :new
    end
  end

  def index
    @draft_count = current_member.stories.is_draft.size
    @published_count = current_member.stories.is_published.size
    @stories = current_member.stories.order(created_at: :desc)
    if params[:status]
      @stories = @stories.is_published if params[:status] == 'published'
      @stories = @stories.is_draft if params[:status] == 'draft'
    else
      @stories = @stories.is_draft
    end    
  end

  def show
    @story = Story.find(params[:id])
  end

  def edit
  end

  def update
    if @story.update(story_params)
      case
      when params[:publish] && @story.draft?
        @story.publish! 
      when params[:unpublish] && @story.published?
        @story.unpublish!
      end
      redirect_to stories_path, notice: '文章修改已儲存'
    else
      render :edit
    end
  end

  def destroy
    @story.destroy
    redirect_to stories_path, notice: '文章已刪除'
  end

  private
  def story_params
    params.require(:story).permit(:title, :content)
  end

  def find_story
    @story = current_member.stories.find(params[:id])
  end
end
