class Api::StoriesController < Api::BaseController
  def clap
    story = Story.friendly.find(params[:id])
    story.increment!(:clap_counter) if story
    render json: {status: story.clap_counter}
  end
end
