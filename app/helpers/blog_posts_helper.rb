module BlogPostsHelper
  def login_helper
    if user_signed_in?
      "<li>".html_safe + (link_to "Hello #{current_user.username}", edit_user_registration_path) + "</li>".html_safe +
      "<li>".html_safe + (link_to 'Sign Out', destroy_user_session_path, :method => 'delete') + "</li>".html_safe
    else
      "<li>".html_safe + (link_to 'Sign In', new_user_session_path) + "</li>".html_safe
    end
  end

  def add_post_helper
    link_to "Add Post", new_blog_path if user_signed_in?
  end

  def edit_blog_helper
    if user_signed_in? && current_user == @blog.user
      (link_to 'Edit', edit_blog_path(@blog)) + " / ".html_safe +
      (link_to 'Destroy', blog_path(@blog), method: :delete, data: {confirm: 'Are you sure?'}) + " / ".html_safe
    end
  end
end
