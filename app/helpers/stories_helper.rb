module StoriesHelper
  def story_page_footer
    if controller_name == 'welcome' && action_name == 'show'
      render 'stories/more_stories'
    end
  end
end
