module CommentsHelper
  def edit_comment_helper(comment)
    if user_signed_in? && current_user == comment.user
      "<hr>".html_safe +
      (link_to 'Edit', edit_blog_comment_path(@blog, comment)) + " / ".html_safe +
      (link_to 'Delete', blog_comment_path(@blog, comment), method: :delete)
    end
  end
end
