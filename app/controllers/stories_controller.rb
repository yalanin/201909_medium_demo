class StoriesController < ApplicationController
  before_action :authenticate_member!, except: :clap
  before_action :find_story, only: [:edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: :clap

  def new
    @story = current_member.stories.new
    if flash[:params].present?
      @story.assign_attributes(flash[:params])
      @story.valid?
    end
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
      flash[:error] = @story.errors.full_messages
      flash[:params] = story_params.to_h
      #render :new
      redirect_to new_story_path
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

  def clap
    if member_signed_in?
      story = Story.friendly.find(params[:id])
      story.increment!(:clap_counter) if story
      render json: {status: story.clap_counter}
    else
      render json: {status: 'sign in first'}
    end
  end

  private
  def story_params
    params.require(:story).permit(:cover, :title, :content)
  end

  def find_story
    @story = current_member.stories.friendly.find(params[:id])
  end
end
