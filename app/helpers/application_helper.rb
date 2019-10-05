module ApplicationHelper
  def nav_avatar(member, size: 250)
    if member.avatar.attached?
      image_tag member.avatar.variant(resize: "#{size}x#{size}"), class: "nav-round-image"
    else
      string = "<img class=\"nav-round-image\">"
      sanitize(string)
    end
  end
end
