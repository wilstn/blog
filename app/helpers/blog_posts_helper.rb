module BlogPostsHelper
  def login_helper
    if user_signed_in?
      "<li><a href='#'>Hello #{current_user.username}</a></li>".html_safe +
      "<li>".html_safe + (link_to 'Sign Out', destroy_user_session_path, :method => 'delete') + "</li>".html_safe
    else
      "<li>".html_safe + (link_to 'Sign In', new_user_session_path) + "</li>".html_safe
    end
  end
end
