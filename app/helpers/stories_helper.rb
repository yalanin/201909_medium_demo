module StoriesHelper
  def story_page_footer
    if controller_name == 'stories' && action_name == 'show'
      render 'stories/more_stories'
    end
  end
end
