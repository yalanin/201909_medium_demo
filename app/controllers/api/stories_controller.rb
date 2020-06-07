class Api::StoriesController < Api::BaseController
  before_action :find_story

  def clap
    @story.increment!(:clap_counter) if @story
    render json: {status: @story.clap_counter}
  end

  def bookmark
    render json: {status: current_member.bookmark!(@story)}
  end

  private
  def find_story
    @story = Story.friendly.find(params[:id])
  end
end
