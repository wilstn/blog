require 'ffaker'

seed_user = User.find_by(username: "John") || User.create( username: "John", password: "123", password_confirmation: "123", email: "xxx@xxx.com")

10.times do
  seed_user.blogs.create(
                title: FFaker::Movie.title ,
                category: FFaker::Book.genre,
                post: FFaker::Book.description
              )
end

seed_blog = seed_user.blogs.last
2.times do
  sc = seed_blog.comments.new(remark: FFaker::Tweet.tweet)
  sc.user = seed_user
  sc.save
end
