module StoriesHelper
  def story_page_footer
    if controller_name == 'welcome' && action_name == 'show'
      render 'stories/more_stories'
    end
  end

  def story_date(story)
    if story.created_at.year == Time.now.year
      story.created_at.strftime('%b %-d')
    else
      story.created_at.strftime('%b %-d,%Y')
    end
  end

  def story_avatar(member, size: 250)
    if member.avatar.attached?
      image_tag member.avatar.variant(resize: "#{size}x#{size}"), class: "member-story-round-image"
    else
      string = "<img class=\"member-story-round-image\">"
      sanitize(string)
    end
  end
end
