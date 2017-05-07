class RemoveAuthorFromBlogs < ActiveRecord::Migration[5.0]
  def change
    remove_column :blogs, :author
    remove_column :comments, :email
    remove_column :comments, :user
  end
end
