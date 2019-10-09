module MemberHelper
  def avatar(member, size: 250)
    if member.avatar.attached?
      image_tag member.avatar.variant(resize: "#{size}x#{size}"), class:"round-image"
    else
      string = "<img class=\"round-image\">"
      sanitize(string)
    end
  end

  def member_page_avatar(member, size: 250)
    if member.avatar.attached?
      image_tag member.avatar.variant(resize: "#{size}x#{size}"), class:"member-page-round-image"
    else
      string = "<img class=\"member-page-round-image\">"
      sanitize(string)
    end
  end
end